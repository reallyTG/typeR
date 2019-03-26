library(visreg)


### Name: visreg
### Title: Visualization of regression functions
### Aliases: visreg

### ** Examples

###################
## Linear models ##
###################

## Basic
fit <- lm(Ozone ~ Solar.R + Wind + Temp, data=airquality)
visreg(fit)
visreg(fit, "Wind", type="contrast")
visreg(fit, "Wind", type="conditional")

## Factors
airquality$Heat <- cut(airquality$Temp, 3, labels=c("Cool","Mild","Hot"))
fit.heat <- lm(Ozone ~ Solar.R + Wind + Heat, data=airquality)
visreg(fit.heat, "Heat", type="contrast")
visreg(fit.heat, "Heat", type="conditional")

## Transformations
fit1 <- lm(Ozone ~ Solar.R + Wind + Temp + I(Wind^2), data=airquality)
fit2 <- lm(log(Ozone) ~ Solar.R + Wind + Temp, data=airquality)
fit3 <- lm(log(Ozone) ~ Solar.R + Wind + Temp + I(Wind^2), data=airquality)
visreg(fit1, "Wind")
visreg(fit2, "Wind", trans=exp, ylab="Ozone")
visreg(fit3, "Wind", trans=exp, ylab="Ozone")

## Conditioning
visreg(fit, "Wind", cond=list(Temp=50))
visreg(fit, "Wind", print.cond=TRUE)
visreg(fit, "Wind", cond=list(Temp=100))

## Interactions
fit.in1 <- lm(Ozone~ Solar.R + Wind*Heat, data=airquality)
visreg(fit.in1, "Wind", by="Heat")
visreg(fit.in1, "Heat", by="Wind")
visreg(fit.in1, "Wind", by="Heat", type="contrast")
visreg(fit.in1, "Heat", by="Wind", breaks=6)
visreg(fit.in1, "Heat", by="Wind", breaks=c(0,10,20))

## Overlay
visreg(fit.in1, "Wind", by="Heat", overlay=TRUE)

######################
## Nonlinear models ##
######################

## Logistic regression
data("birthwt", package="MASS")
birthwt$race <- factor(birthwt$race, labels=c("White","Black","Other"))
birthwt$smoke <- factor(birthwt$smoke, labels=c("Nonsmoker","Smoker"))
fit <- glm(low~age+race+smoke+lwt, data=birthwt, family="binomial")
visreg(fit, "lwt",
       xlab="Mother's Weight", ylab="Log odds (low birthweight)")
visreg(fit, "lwt", scale="response", partial=FALSE,
       xlab="Mother's Weight", ylab="P(low birthweight)")
visreg(fit, "lwt", scale="response", partial=FALSE,
       xlab="Mother's Weight", ylab="P(low birthweight)", rug=2)

## Proportional hazards
require(survival)
data(ovarian)
ovarian$rx <- factor(ovarian$rx)
fit <- coxph(Surv(futime, fustat) ~ age + rx, data=ovarian)
visreg(fit, "age", ylab="log(Hazard ratio)")

## Robust regression
require(MASS)
fit <- rlm(Ozone ~ Solar.R + Wind*Heat, data=airquality)
visreg(fit, "Wind", cond=list(Heat="Mild"))

## And more...; anything with a 'predict' method should work

## Return raw components of plot
v <- visreg(fit, "Wind", cond=list(Heat="Mild"))



