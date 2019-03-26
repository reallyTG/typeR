library(VARsignR)


### Name: uhlig.penalty
### Title: Uhlig's (2005) penalty function method
### Aliases: uhlig.penalty
### Keywords: ts models

### ** Examples

## Not run: 
##D # Replication of Figure 14 of Uhlig (2005)
##D 
##D set.seed(12345)
##D data(uhligdata)
##D 
##D # variable labels for plots
##D vl <- c("GDP","GDP Deflator","Comm.Pr.Index","Fed Funds Rate",
##D         "NB Reserves", "Total Reserves")
##D 
##D # sign restrictions
##D # shock of interest enters first.
##D # you MUST provide a restriction for the shock of interest
##D # restriction variable 4 is >0
##D # 2nd, 3rd, and 5th variable are <0.
##D # 1st and 6th variable are unrestricted
##D constr <- c(+4,-3,-2,-5)
##D 
##D # estimates the model
##D model2 <- uhlig.penalty(Y=uhligdata, nlags=12, draws=2000, subdraws=1000,
##D                         nkeep=1000, KMIN=1, KMAX=6, constrained=constr,
##D                         constant=FALSE, steps=60, penalty=100, crit=0.001)
##D 
##D # get posterior draws
##D irfs2 <- model2$IRFS
##D 
##D # plot impulse response functions
##D irfplot(irfdraws=irfs2, type="mean", labels=vl, save=FALSE, bands=c(0.16, 0.84),
##D         grid=TRUE, bw=FALSE)
##D 
## End(Not run)
 


