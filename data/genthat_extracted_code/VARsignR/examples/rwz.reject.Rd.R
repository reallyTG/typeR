library(VARsignR)


### Name: rwz.reject
### Title: Rubio-Ramirez et al's (2010) rejection method
### Aliases: rwz.reject
### Keywords: ts models

### ** Examples

## Not run: 
##D # Replication of Figure 6 of Uhlig (2005) using Rubio-Ramirez et al's method
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
##D 
##D constr <- c(+4,-3,-2,-5)
##D 
##D # estimates the model
##D model3 <- rwz.reject(Y=uhligdata, nlags=12, draws=200, subdraws=200, nkeep=1000,
##D                       KMIN=1, KMAX=6, constrained=constr, constant=FALSE, steps=60)
##D 
##D # get posterior draws
##D irfs3 <- model3$IRFS
##D 
##D # plot impulse response functions
##D irfplot(irfdraws=irfs3, type="median", labels=vl, save=FALSE, bands=c(0.16, 0.84),
##D         grid=TRUE, bw=FALSE)
##D 
## End(Not run)
 


