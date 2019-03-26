library(gap)


### Name: qqunif
### Title: Q-Q plot for uniformly distributed random variable
### Aliases: qqunif
### Keywords: hplot distribution univar

### ** Examples

## Not run: 
##D # Q-Q Plot for 1000 U(0,1) r.v., marking those <= 1e-5
##D u_obs <- runif(1000)
##D r <- qqunif(u_obs,pch=21,bg="blue",bty="n")
##D u_exp <- r$y
##D hits <- u_exp >= 2.30103
##D points(r$x[hits],u_exp[hits],pch=21,bg="green")
## End(Not run)



