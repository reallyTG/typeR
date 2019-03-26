library(SignifReg)


### Name: SignifReg
### Title: Consistent Significance Controlled Variable Selection in Linear
###   Regression
### Aliases: SignifReg

### ** Examples

##mtcars data is used as an example.

data(mtcars)
scope1 <- mpg~.
model1 <- SignifReg(scope=scope1,data=mtcars,alpha=0.05,
direction="forward", criterion="p-value",
correction="FDR")

model2 <-SignifReg(scope=scope1,data=mtcars,alpha=0.05,
direction="step_full", criterion="Cp",
correction="Bonferroni")

scope2 <- mpg~cyl+disp+hp+drat+wt+qsec
model3 <-SignifReg(scope=scope2,data=mtcars,alpha=0.05,
direction="step_null", criterion="AIC",
correction="None")

summary(model1)
summary(model2)
summary(model3)



