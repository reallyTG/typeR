library(FSA)


### Name: catchCurve
### Title: Mortality estimates from the descending limb of a catch curve.
### Aliases: catchCurve catchCurve.default catchCurve.formula
###   plot.catchCurve summary.catchCurve coef.catchCurve anova.catchCurve
###   confint.catchCurve rSquared.catchCurve
### Keywords: hplot htest manip

### ** Examples

plot(catch~age,data=BrookTroutTH,pch=19)

## demonstration of formula notation
cc1 <- catchCurve(catch~age,data=BrookTroutTH,ages2use=2:6)
summary(cc1)
cbind(Est=coef(cc1),confint(cc1))
rSquared(cc1)
plot(cc1)
summary(cc1,parm="Z")
cbind(Est=coef(cc1,parm="Z"),confint(cc1,parm="Z"))

## demonstration of excluding ages2use
cc2 <- catchCurve(catch~age,data=BrookTroutTH,ages2use=-c(0,1))
summary(cc2)
plot(cc2)

## demonstration of using weights
cc3 <- catchCurve(catch~age,data=BrookTroutTH,ages2use=2:6,weighted=TRUE)
summary(cc3)
plot(cc3)

## demonstration of returning the linear model results
summary(cc3,parm="lm")
cbind(Est=coef(cc3,parm="lm"),confint(cc3,parm="lm"))

## demonstration of ability to work with missing age classes
df <- data.frame(age=c(  2, 3, 4, 5, 7, 9,12),
                 ct= c(100,92,83,71,56,35, 1))
cc4 <- catchCurve(ct~age,data=df,ages2use=4:12)
summary(cc4)
plot(cc4)

## demonstration of ability to work with missing age classes
## evein if catches are recorded as NAs
df <- data.frame(age=c(  2, 3, 4, 5, 6, 7, 8, 9,10,11,12),
                 ct= c(100,92,83,71,NA,56,NA,35,NA,NA, 1))
cc5 <- catchCurve(ct~age,data=df,ages2use=4:12)
summary(cc5)
plot(cc5)




