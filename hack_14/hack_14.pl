=pod

hack #14 RetroSheet.comからデータを取得する

=cut

use FileHandle;
use LWP::UserAgent;

$ua = LWP::UserAgent->new;
$baseurl = "http://www.retrosheet.org/";

for ($year=60; $year<=92; $year++) {
	foreach $league("al", "nl") {
		my $filename = "19".$year.$league.".zip";
		my $url = $baseurl."19".$year."/19".$year.$league.".zip";
		my $req = HTTP::Request->new(GET => $url);
		my $res = $ua->request($req);

		print STDERR "fetching $filename\n";

		if ($res->is_success) {
			my $fh = new FileHandle ">$filename";
			if (defined $fh) {
				print $fh $res->content;
				$fh->close;
			} else {
				print STDERR "cloud not open file $filenam: $!\n";
			}
		} else {
			print STDERR $res->status_line, "\n";
		}
	}
}

$league = "ml";
for ($year=0; $year<=9; $year++) {
	my $filename = "200".$year.$league.".zip";
	my $url = $baseurl."200".$year."/200".$year.$league.".zip";
	my $req = HTTP::Request->new(GET => $url);
	my $res = $ua->request($req);

	print STDERR "fetching $filename\n";

	if ($res->is_success) {
		my $fh = new FileHandle ">$filename";
		if (defined $fh) {
			print $fh $res->content;
			$fh->close;
		} else {
			print STDERR "cloud not open file $filenam: $!\n";
		}
	} else {
		print STDERR $res->status_line, "\n";
	}
}