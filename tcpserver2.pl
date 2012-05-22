#!/usr/local/bin/perl

use Socket;

#----------------MAIN-------------------
if($0 eq __FILE__){
	$port = ($ARGV[0] || 12345);
	socket(SH,PF_INET,SOCK_STREAM,0) 	|| die "cant open socket:$!";
	bind(SH,sockaddr_in($port,INADDR_ANY)) 	|| die "cant bind to me:$!";
	listen(SH,5) || die "cant listen socket:$!";
	while(1){
	accept(SHA,SH) 	|| die "can't accept socket:$!";
		while($n = sysread(SHA,$buf,1000000)){
			print $n, " bytes recieved\n";
		}
		close(SHA);
	}	
	close(SH);
}
1;
