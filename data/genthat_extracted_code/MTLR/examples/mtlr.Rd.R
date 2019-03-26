library(MTLR)


### Name: mtlr
### Title: Train a Multi-Task Logistic Regression (MTLR) Model
### Aliases: mtlr

### ** Examples

#Access the Surv function and the leukemia/lung dataset.
library(survival)
simple_mod <- mtlr(Surv(time,status)~., data = leukemia)
simple_mod

bigger_mod <- mtlr(Surv(time,status)~., data = lung)
bigger_mod

#Note that observations with missing data were removed:
nrow(lung)
nrow(bigger_mod$x)


# Mixed censoring types
time1 = c(NA, 4, 7, 12, 10, 6, NA, 3) #NA for right censored
time2 = c(14, 4, 10, 12, NA, 9, 5, NA) #NA for left censored
#time1 == time2 indicates an exact death time. time2> time1 indicates interval censored.
set.seed(42)
dat = cbind.data.frame(time1, time2, importantfeature = rnorm(8))
formula = Surv(time1,time2,type = "interval2")~.
mixedmod = mtlr(formula, dat)




