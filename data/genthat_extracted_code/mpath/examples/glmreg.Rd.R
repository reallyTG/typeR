library(mpath)


### Name: glmreg
### Title: fit a GLM with lasso (or elastic net), snet or mnet
###   regularization
### Aliases: glmreg glmreg.formula glmreg.matrix glmreg.default
###   logLik.glmreg deviance.glmreg
### Keywords: models regression

### ** Examples

#binomial
x=matrix(rnorm(100*20),100,20)
g2=sample(0:1,100,replace=TRUE)
fit2=glmreg(x,g2,family="binomial")
#poisson and negative binomial
data("bioChemists", package = "pscl")
fm_pois <- glmreg(art ~ ., data = bioChemists, family = "poisson")
coef(fm_pois)
fm_nb1 <- glmreg(art ~ ., data = bioChemists, family = "negbin", theta=1)
coef(fm_nb1)
## Not run: 
##D fm_nb2 <- glmregNB(art ~ ., data = bioChemists)
##D coef(fm_nb2)
## End(Not run)



