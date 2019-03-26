library(selectMeta)


### Name: DearBeggMonotoneCItheta
### Title: Compute an approximate profile likelihood ratio confidence
###   interval for effect estimate
### Aliases: DearBeggMonotoneCItheta DearBeggProfileLL
###   DearBeggToMinimizeProfile
### Keywords: nonparametric

### ** Examples

## Not run: 
##D ## compute confidence interval for theta in the education dataset
##D data(education)
##D N  <- education$N
##D y  <- education$theta
##D u  <- sqrt(2 / N)
##D lam1 <- 2
##D res.edu <- DearBeggMonotone(y, u, lam = lam1, maxiter = 1000, 
##D     CR = 1, trace = FALSE)
##D r1 <- DearBeggMonotoneCItheta(res.edu, lam = 2, conf.level = 0.95)
##D res.edu$theta
##D r1$ci.theta
##D 
##D ## compute confidence interval for theta in the passive smoking dataset
##D data(passive_smoking)
##D u <- passive_smoking$selnRR
##D y <- passive_smoking$lnRR
##D lam1 <- 2
##D res.toba <- DearBeggMonotone(y, u, lam = lam1, maxiter = 1000, 
##D     CR = 1, trace = FALSE)
##D r2 <- DearBeggMonotoneCItheta(res.toba, lam = 2, conf.level = 0.95)
##D res.toba$theta
##D r2$ci.theta
## End(Not run)



