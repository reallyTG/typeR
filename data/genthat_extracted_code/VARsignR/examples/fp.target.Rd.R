library(VARsignR)


### Name: fp.target
### Title: Fry and Pagan's (2011) median target method
### Aliases: fp.target
### Keywords: ts models

### ** Examples

## Not run: 
##D # Replication of Figure 6 of Uhlig (2005)
##D 
##D set.seed(12345)
##D data(uhligdata)
##D 
##D # variable labels for plots
##D vl <- c("GDP","GDP Deflator","Comm.Pr.Index","Fed Funds Rate",
##D         "NB Reserves", "Total Reserves")
##D 
##D # sign restrictions
##D constr <- c(+4,-3,-2,-5)
##D 
##D # estimates the model
##D model1 <- uhlig.reject(Y=uhligdata, nlags=12, draws=200, subdraws=200, nkeep=1000,
##D                       KMIN=1, KMAX=6, constrained=constr, constant=FALSE, steps=60)
##D 
##D # get posterior draws
##D irfs1 <- model1$IRFS
##D 
##D # estimate Fry and Pagan's MT method
##D fp.target(Y=uhligdata, nlags=12, irfdraws=irfs1, constant=F, type="median",
##D             labels=vl, target= TRUE, save=FALSE, legend=TRUE,
##D             bands=c(0.16, 0.84), grid=TRUE, bw=FALSE, maxit=1000)
##D 
## End(Not run)
 


