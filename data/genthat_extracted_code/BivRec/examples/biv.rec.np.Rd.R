library(BivRec)


### Name: biv.rec.np
### Title: Non-Parametric Analysis of Bivariate Alternating Recurrent Event
###   Gap Time Data
### Aliases: biv.rec.np
### Keywords: biv.rec.np

### ** Examples

library(BivRec)
# Simulate bivariate alternating recurrent event data
set.seed(1234)
biv.rec.data <- biv.rec.sim(nsize=150, beta1=c(0.5,0.5), beta2=c(0,-0.5), tau_c=63, set=1.1)
# Apply the non-parametric method of Huang and Wang (2005) and
# Visualize joint cdf and marginal survival results
nonpar.result <- biv.rec.np(formula = id + epi + xij + yij + d1 + d2 ~ 1,
          data=biv.rec.data, ai=1, u1 = c(2, 5, 10, 20), u2 = c(1, 5, 10, 15),
          conditional = FALSE, given.interval=c(0, 10), jointplot=TRUE,
          marginalplot = TRUE, condiplot = FALSE)
head(nonpar.result$joint.cdf)
head(nonpar.result$marginal.survival)

## Not run: 
##D #This is an example with longer runtime.
##D library(BivRec)
##D # Simulate bivariate alternating recurrent event data
##D set.seed(1234)
##D biv.rec.data <- biv.rec.sim(nsize=150, beta1=c(0.5,0.5), beta2=c(0,-0.5), tau_c=63, set=1.1)
##D 
##D # Apply the non-parametric method of Huang and Wang (2005) and Visualize all results
##D nonpar.result <- biv.rec.np(formula = id + epi + xij + yij + d1 + d2 ~ 1,
##D           data=biv.rec.data, ai=1, u1 = c(2, 5, 10, 20), u2 = c(1, 5, 10, 15),
##D           conditional = TRUE, given.interval=c(0, 10), jointplot=TRUE,
##D           marginalplot = TRUE, condiplot = TRUE)
##D head(nonpar.result$joint.cdf)
##D head(nonpar.result$marginal.survival)
##D head(nonpar.result$conditional.cdf)
## End(Not run)



