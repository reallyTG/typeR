library(copBasic)


### Name: simcomposite3COP
### Title: Compute the L-comoments of a Four-Value Composited Copula by
###   Simulation
### Aliases: simcomposite3COP
### Keywords: copula composition copula (simulation) visualization
###   L-comoments

### ** Examples

## Not run: 
##D # EXAMPLE 1: Make a single simulation result.
##D mainpara <- list(cop1=PLACKETTcop, cop2=PLACKETTcop,
##D                  para1gen=function() { return(c(10^runif(1,min=-5,max=0))) },
##D                  para2gen=function() { return(c(10^runif(1,min= 0,max=5))) })
##D v <- simcompositeCOP(nsim=1, parent=mainpara, showresults=TRUE)
##D print(v)
##D 
##D # EXAMPLE 2: Make 1000 "results" and plot two columns.
##D mainpara <- list(cop1=PLACKETTcop, cop2=N4212cop,
##D                  para1gen=function() { return(c(10^runif(1,min=-5,max=5))) },
##D                  para2gen=function() { return(c(10^runif(1,min= 0,max=2))) })
##D v <- simcomposite3COP(nsim=100, parent=mainpara); labs <- colnames(v)
##D plot(v[,5],v[,7], # open circles are 1 with respect to 2
##D      xlab=paste(c(labs[5], "and", labs[6]), collapse=" "),
##D      ylab=paste(c(labs[6], "and", labs[8]), collapse=" "))
##D points(v[,6],v[,8], pch=16) # black dots are 2 with respect to 1
## End(Not run)



