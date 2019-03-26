library(BSagri)


### Name: simplesimint
### Title: Simultaneous confidence intervals from raw estimates
### Aliases: simplesimint
### Keywords: htest

### ** Examples



# For the simple case of Gaussian response
# variables with homoscedastic variance,
# see the following example


library(mratios)
data(angina)

boxplot(response ~ dose, data=angina)

# Fit a cell means model,

fit<-lm(response ~ 0+dose, data=angina)

# extract cell means, the corresponding
# variance-covariance matrix and the
# residual degree of freedom,

cofi<-coef(fit)
vcofi<-vcov(fit)
dofi<-fit$df.residual

# define an appropriate contrast matrix,
# here, comparisons to control

n<-unlist(lapply(split(angina$response, f=angina$dose), length))
names(n)<-names(cofi)

cmat<-contrMat(n=n, type="Dunnett")
cmat

#

test<-simplesimint(coef=cofi, vcov=vcofi, df=dofi, cmat=cmat, alternative="greater" )

test

summary(test)

plotCI(test)

### Note, that the same result can be achieved much more conveniently
### using confint.glht in package multcomp





