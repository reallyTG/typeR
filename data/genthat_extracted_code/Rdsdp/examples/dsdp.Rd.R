library(Rdsdp)


### Name: Rdsdp::dsdp
### Title: Solve semidefinite programm with DSDP
### Aliases: dsdp

### ** Examples

	K=NULL
	K$s=c(2,3)
	K$l=2

	C=matrix(c(0,0,2,1,1,2,c(3,0,1,
                       0,2,0,
                       1,0,3)),1,15,byrow=TRUE)
	A=matrix(c(0,1,0,0,0,0,c(3,0,1,
                         0,4,0,
                         1,0,5),
          	1,0,3,1,1,3,rep(0,9)), 2,15,byrow=TRUE)
	b <- c(1,2)
	
    OPTIONS=NULL
    OPTIONS$gaptol=0.000001
    OPTIONS$logsummary=0
    OPTIONS$outputstats=1
	
    result = dsdp(A,b,C,K,OPTIONS)



