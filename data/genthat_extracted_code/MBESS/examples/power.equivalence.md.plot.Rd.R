library(MBESS)


### Name: power.equivalence.md.plot
### Title: Plot power of Two One-Sided Tests Procedure (TOST) for
###   Equivalence
### Aliases: power.equivalence.md.plot
### Keywords: design

### ** Examples

## Not run: 
##D # Suppose that two formulations of a drug are to be compared 
##D # on the regular scale using a two-period crossover design, 
##D # with theta1 = -0.20, theta2 = 0.20, rm(CV) = 0.20, and 
##D # we choose 
##D n<-c(9,12,18,24,30,40,60)
##D 
##D # corresponding to 
##D nu<-c(7,10,16,22,28,38,58)
##D 
##D # degrees of freedom.  We need to test bioequivalence at the 
##D # .05 significance level, which corresponds to having a .90 confidence
##D # interval lying within (-0.20, 0.20). This corresponds to 
##D # Phillips (1990),  Figure 3.  Use
##D 
##D power.equivalence.md.plot(.05, FALSE, -.2, .2, .20, n, nu, 'Phillips Figure 3')
##D 
##D # If the formulations are compared on the logarithmic scale with 
##D # theta1 = 0.80, theta2 = 1.25, and 
##D 
##D n<-c(8,12,18,24,30,40,60)
##D 
##D # corresponding  to 
##D nu<-c(6,10,16,22,28,38,58)
##D 
##D # degrees of freedom. This corresponds to Diletti, Figure 1c. Use
##D 
##D power.equivalence.md.plot(.05, TRUE, .8, 1.25, .20, n, nu, 'Diletti, Figure 1c')
## End(Not run)



