library(metafor)


### Name: dat.nielweise2008
### Title: Studies on Anti-Infective-Treated Central Venous Catheters for
###   Prevention of Catheter-Related Bloodstream Infections
### Aliases: dat.nielweise2008
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.nielweise2008))

### standard (inverse-variance) random-effects model
res <- rma(measure="IRR", x1i=x1i, t1i=t1i, x2i=x2i, t2i=t2i, data=dat)
print(res, digits=3)
predict(res, transf=exp, digits=2)

### random-effects conditional Poisson model
## Not run: 
##D res <- rma.glmm(measure="IRR", x1i=x1i, t1i=t1i, x2i=x2i, t2i=t2i, data=dat, model="CM.EL")
##D print(res, digits=3)
##D predict(res, transf=exp, digits=2)
## End(Not run)



