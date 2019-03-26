library(metafor)


### Name: dat.nielweise2007
### Title: Studies on Anti-Infective-Treated Central Venous Catheters for
###   Prevention of Catheter-Related Bloodstream Infections
### Aliases: dat.nielweise2007
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.nielweise2007))

### standard (inverse-variance) random-effects model
res <- rma(measure="OR", ai=ai, n1i=n1i, ci=ci, n2i=n2i, data=dat, drop00=TRUE)
print(res, digits=3)
predict(res, transf=exp, digits=2)

### random-effects conditional logistic model
## Not run: 
##D res <- rma.glmm(measure="OR", ai=ai, n1i=n1i, ci=ci, n2i=n2i, data=dat, model="CM.EL")
##D print(res, digits=3)
##D predict(res, transf=exp, digits=2)
## End(Not run)



