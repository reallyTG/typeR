library(rpart)


### Name: stagec
### Title: Stage C Prostate Cancer
### Aliases: stagec
### Keywords: datasets

### ** Examples

require(survival)
rpart(Surv(pgtime, pgstat) ~ ., stagec)



