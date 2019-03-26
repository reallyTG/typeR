library(hnp)


### Name: oil
### Title: _Diaphorina citri_ oviposition data
### Aliases: oil
### Keywords: datasets

### ** Examples

data(oil)

# Poisson fit
model1 <- glm(y ~ treat, family=poisson, data=oil)
anova(model1, test="Chisq")
sum(resid(model1, ty="pearson")^2)

# Quasi-Poisson fit
model2 <- glm(y ~ treat, family=quasipoisson, data=oil)
summary(model2)
anova(model2,test="F")
summary(model2)$dispersion

# Negative binomial fit
require(MASS)
model3 <- glm.nb(y ~ treat, data=oil)
thetahat <- summary(model3)$theta
anova(model3, test="F")

# half-normal plots
par(mfrow=c(1,3),cex=1.4, cex.main=0.9)
hnp(model1,pch=4, main="(a) Poisson",
     xlab="Half-normal scores", ylab="Deviance residuals")
hnp(model2,pch=4, main="(b) Quasi-Poisson",
     xlab="Half-normal scores", ylab='')
hnp(model3,pch=4, main="(c) Negative binomial",
     xlab="Half-normal scores", ylab='')

## Not run: 
##D # using aods3
##D require(aods3)
##D model3b <- aodml(y ~ treat, family="nb", phi.scale="inverse",
##D                  fixpar=list(8, 1.086148), data=oil)
##D hnp(model3b)
## End(Not run)

## for discussion on the analysis of this data set,
## see Demetrio et al. (2014)



