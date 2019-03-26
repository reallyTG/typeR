library(mice)


### Name: boys
### Title: Growth of Dutch boys
### Aliases: boys
### Keywords: datasets

### ** Examples



# create two imputed data sets
imp <- mice(boys, m=1, maxit=2)
z <- complete(imp, 1)

# create imputations for age <8yrs
plot(z$age, z$gen, col=mdc(1:2)[1+is.na(boys$gen)],
 xlab = "Age (years)", ylab = "Tanner Stage Genital")

# figure to show that the default imputation method does not impute BMI 
# consistently
plot(z$bmi,z$wgt/(z$hgt/100)^2, col=mdc(1:2)[1+is.na(boys$bmi)],
xlab = "Imputed BMI", ylab="Calculated BMI")   

# also, BMI distributions are somewhat different
require(MASS)
oldpar <- par(mfrow=c(1,2))
truehist(z$bmi[!is.na(boys$bmi)],h=1,xlim=c(10,30),ymax=0.25,
col=mdc(1),xlab="BMI observed")
truehist(z$bmi[is.na(boys$bmi)],h=1,xlim=c(10,30),ymax=0.25,
col=mdc(2),xlab="BMI imputed")
par(oldpar)

# repair the inconsistency problem by passive imputation
meth <- imp$meth
meth["bmi"] <- "~I(wgt/(hgt/100)^2)"
pred <- imp$predictorMatrix
pred["hgt","bmi"] <- 0
pred["wgt","bmi"] <- 0
imp2 <- mice(boys, m=1, maxit=2, meth=meth, pred=pred)
z2 <- complete(imp2, 1)

# show that new imputations are consistent
plot(z2$bmi,z2$wgt/(z2$hgt/100)^2, col=mdc(1:2)[1+is.na(boys$bmi)],
ylab="Calculated BMI")   

# and compare distributions
oldpar <- par(mfrow=c(1,2))
truehist(z2$bmi[!is.na(boys$bmi)],h=1,xlim=c(10,30),ymax=0.25,col=mdc(1),
xlab="BMI observed")
truehist(z2$bmi[is.na(boys$bmi)],h=1,xlim=c(10,30),ymax=0.25,col=mdc(2),
xlab="BMI imputed")
par(oldpar)





