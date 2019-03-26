library(mcglm)


### Name: NewBorn
### Title: Respiratory Physiotherapy on Premature Newborns.
### Aliases: NewBorn
### Keywords: datasets

### ** Examples

library(mcglm)
library(Matrix)
data(NewBorn, package="mcglm")
formu <- SPO2 ~ Sex + APGAR1M + APGAR5M + PRE + HD + SUR
Z0 <- mc_id(NewBorn)
fit <- mcglm(linear_pred = c(formu), matrix_pred = list(Z0),
            link = c("logit"), variance = c("binomialP"),
            power_fixed = c(TRUE),
            data = NewBorn,
            control_algorithm = list(verbose = FALSE, tuning = 0.5))
summary(fit)



