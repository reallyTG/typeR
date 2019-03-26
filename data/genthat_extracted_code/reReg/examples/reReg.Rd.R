library(reReg)


### Name: reReg
### Title: Fits Semiparametric Regression Models for Recurrent Event Data
### Aliases: reReg

### ** Examples

## readmission data
data(readmission, package = "frailtypack")
set.seed(123)
## Accelerated Mean Model
(fit <- reReg(reSurv(t.stop, id, event, death) ~ sex + chemo,
              data = subset(readmission, id < 50),
              method = "am.XCHWY", se = "resampling", B = 20))
summary(fit)

## Generalized Scale-Change Model
set.seed(123)
(fit <- reReg(reSurv(t.stop, id, event, death) ~ sex + chemo,
              data = subset(readmission, id < 50),
              method = "sc.XCYH", se = "resampling", B = 20))
summary(fit)



