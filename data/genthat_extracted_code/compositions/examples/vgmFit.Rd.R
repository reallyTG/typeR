library(compositions)


### Name: vgmFit
### Title: Compositional variogram model fitting
### Aliases: vgmFit vgmFit2lrv vgmGetParameters vgmSetParameters vgmGof
### Keywords: multivariate

### ** Examples

## Not run: 
##D data(juraset)
##D X <- with(juraset,cbind(X,Y))
##D comp <- acomp(juraset,c("Cd","Cu","Pb","Co","Cr"))
##D lrv <- logratioVariogram(comp,X,maxdist=1,nbins=10)
##D fff <- CompLinModCoReg(~nugget()+sph(0.5)+R1*exp(0.7),comp)
##D fit <- vgmFit(lrv,fff)
##D fit
##D fff(1:3)
##D plot(lrv,lrvg=vgram2lrvgram(fit$vg))
## End(Not run)



