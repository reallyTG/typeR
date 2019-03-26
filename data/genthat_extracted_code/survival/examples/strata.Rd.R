library(survival)


### Name: strata
### Title: Identify Stratification Variables
### Aliases: strata
### Keywords: survival

### ** Examples

a <- factor(rep(1:3,4), labels=c("low", "medium", "high"))
b <- factor(rep(1:4,3))
levels(strata(b))
levels(strata(a,b,shortlabel=TRUE))

coxph(Surv(futime, fustat) ~ age + strata(rx), data=ovarian) 



