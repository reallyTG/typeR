library(binGroup)


### Name: gtreg.mp
### Title: Fitting Group Testing Models in Matrix Pooling Setting
### Aliases: gtreg.mp EM.mp
### Keywords: regression

### ** Examples

## --- Continuing the Example from  '?sim.mp':
# 5*6 and 4*5 matrix
set.seed(9128)
sa1a<-sim.mp(par=c(-7,0.1), n.row=c(5,4), n.col=c(6,5),
 sens=0.95, spec=0.95)
sa1<-sa1a$dframe


## Not run: 
##D fit1 <- gtreg.mp(formula = cbind(col.resp, row.resp) ~ x, data = sa1, 
##D                  coln = coln, rown = rown, arrayn = arrayn, 
##D                  sens = 0.95, spec = 0.95, tol = 0.005, n.gibbs = 2000, trace = TRUE)
##D fit1
##D summary(fit1)
##D 
## End(Not run)

## Here is an example of how long this fitting process may take. For the 
## following simulated data, it takes a computer with 2.2GHZ processor and 
## 3GB RAM about 6 minutes to achieve convergence.
set.seed(9012)
sa2a<-sim.mp(par=c(-7,0.1), n.row=c(10,10,10,10), n.col=c(10,10,10,10), 
             sens=0.95, spec=0.95)
sa2<-sa2a$dframe

## Not run: 
##D fit2 <- gtreg.mp(formula = cbind(col.resp, row.resp) ~ x, data = sa2, 
##D                  coln = coln, rown = rown, arrayn = arrayn, retest = retest,
##D                  sens = 0.95, spec = 0.95, start = c(-7, 0.1), tol = 0.005)
##D 
##D fit2
##D summary(fit2)
##D 
## End(Not run)




