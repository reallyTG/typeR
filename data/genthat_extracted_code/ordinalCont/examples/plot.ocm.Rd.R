library(ordinalCont)


### Name: plot.ocm
### Title: Plot method for Continuous Ordinal Fits
### Aliases: plot.ocm
### Keywords: plot

### ** Examples

fit.overall  <- ocm(overall  ~ cycleno + age + bsa + treatment, data=ANZ0001.sub, scale=c(0,100))
plot(fit.overall, CIs="vcov")
## Not run: 
##D plot(fit.overall, CIs="rnd.x.bootstrap", R=100)
##D plot(fit.overall, CIs="fix.x.bootstrap", R=100)
##D plot(fit.overall, CIs="param.bootstrap", R=100)
## End(Not run)



