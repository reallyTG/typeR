library(binGroup)


### Name: summary.gt.mp
### Title: Summary Method for Group Testing Model (Matrix Pooling) Fits
### Aliases: summary.gt.mp
### Keywords: print

### ** Examples


## --- Continuing the Example from  '?sim.mp' and '?gtreg.mp':
# 5*6 and 4*5 matrix

set.seed(9128)
sa1a<-sim.mp(par=c(-7,0.1), n.row=c(5,4), n.col=c(6,5),
  sens=0.95, spec=0.95)
sa1<-sa1a$dframe

## Not run: 
##D fit1mp <- gtreg.mp(formula = cbind(col.resp, row.resp) ~ x, data = sa1, 
##D   coln = coln, rown = rown, arrayn = arrayn, 
##D   sens = 0.95, spec = 0.95, linkf = "logit", n.gibbs = 1000, tol = 0.005)
##D 
##D summary(fit1mp)
## End(Not run)




