library(mvabund)


### Name: anova.manyany
### Title: Analysis of Deviance for Many Univariate Models Fitted to
###   Multivariate Abundance Data
### Aliases: anova.manyany print.anova.manyany
### Keywords: models regression multivariate

### ** Examples

## Try fitting Tikus Islands data with Tweedie models with power parameter 1.5,
## to test for compositional effect:
data(tikus)
coral <- as.matrix(tikus$abund[1:20,])
sumSpp = apply(coral>0,2,sum)

coral <- coral[,sumSpp>6] ## cutting to just species with seven(!) or more presences to cut
## computation time.  Maybe rerun with less (e.g. 4 or more presences) if curious and patient.
coralX <- tikus$x[1:20,]

require(tweedie)
require(statmod)

ftTimeRep <- manyany("glm", coral, coral ~ time+rep, data=coralX, 
family=tweedie(var.power=1.5, link.power=0), var.power=1.5, composition=TRUE)

ftRep <- manyany("glm",coral, coral ~ rep, data=coralX, 
family=tweedie(var.power=1.5, link.power=0), var.power=1.5, composition=TRUE)
anova(ftRep,ftTimeRep,nBoot=9) #this takes a few seconds to run even for just 9 resamples
## This should be rerun for nBoot=999, which would take maybe five minutes...




