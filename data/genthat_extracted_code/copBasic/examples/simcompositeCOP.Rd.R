library(copBasic)


### Name: simcompositeCOP
### Title: Compute the L-comoments of a Two-Value Composited Copula by
###   Simulation
### Aliases: simcompositeCOP simcomposite2COP
### Keywords: copula composition copula (simulation) visualization
###   L-comoments

### ** Examples

## Not run: 
##D # A single simulation result.
##D mainpara <- list(cop1=PLACKETTcop, cop2=PLACKETTcop,
##D                  para1gen=function() { return(c(10^runif(1,min=-5,max=0))) },
##D                  para2gen=function() { return(c(10^runif(1,min= 0,max=5))) })
##D v <- simcompositeCOP(nsim=1, parent=mainpara, showresults=TRUE)
##D print(v) # for review 
## End(Not run)



