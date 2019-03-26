library(immer)


### Name: lc2_agreement
### Title: A Latent Class Model for Agreement of Two Raters
### Aliases: lc2_agreement summary.lc2_agreement logLik.lc2_agreement
###   anova.lc2_agreement

### ** Examples

#############################################################################
# EXAMPLE 1: Dataset in Schuster and Smith (2006)
#############################################################################

data(data.immer08)
dat <- data.immer08

# select ratings and frequency weights
y <- dat[,1:2]
w <- dat[,3]

#*** Model 1: Uniform distribution phi parameters
mod1 <- immer::lc2_agreement( y=y, w=w, type="unif")
summary(mod1)

#*** Model 2: Equal phi and tau parameters
mod2 <- immer::lc2_agreement( y=y, w=w, type="equal")
summary(mod2)

## Not run: 
##D #*** Model 3: Homogeneous rater model
##D mod3 <- immer::lc2_agreement( y=y, w=w, type="homo")
##D summary(mod3)
##D 
##D #*** Model 4: Heterogeneous rater model
##D mod4 <- immer::lc2_agreement( y=y, w=w, type="hete")
##D summary(mod4)
##D 
##D #--- some model comparisons
##D anova(mod3,mod4)
##D IRT.compareModels(mod1,mod2,mod3,mod4)
## End(Not run)



