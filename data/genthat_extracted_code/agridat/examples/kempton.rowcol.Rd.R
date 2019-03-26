library(agridat)


### Name: kempton.rowcol
### Title: Wheat row-column experiment
### Aliases: kempton.rowcol

### ** Examples


data(kempton.rowcol)
dat <- kempton.rowcol
dat <- transform(dat, rowf=factor(row), colf=factor(col))

if(require(desplot)){
  desplot(yield~col*row|rep, dat,
          num=gen, out1=rep, # unknown aspect
          main="kempton.rowcol")
}


## Not run: 
##D   # Model with rep, row, col as random.  Kempton, page 62.
##D   # Use "-1" so that the vcov matrix doesn't include intercept
##D   require(lme4)
##D   m1 <- lmer(yield ~ -1 + gen + rep + (1|rep:rowf) + (1|rep:colf), data=dat)
##D   
##D   # Variance components match Kempton.
##D   print(m1, corr=FALSE)
##D   
##D   # Standard error of difference for genotypes.  Kempton page 62, bottom.
##D   covs <- as.matrix(vcov(m1)[1:35, 1:35])
##D   vars <- diag(covs)
##D   vdiff <- outer(vars, vars, "+") - 2 * covs
##D   sed <- sqrt(vdiff[upper.tri(vdiff)])
##D   min(sed) # Minimum SED
##D   mean(sed) # Average SED
##D   max(sed) # Maximum SED
## End(Not run)




