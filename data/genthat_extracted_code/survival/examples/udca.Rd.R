library(survival)


### Name: udca
### Title: Data from a trial of usrodeoxycholic acid
### Aliases: udca udca1 udca2
### Keywords: datasets

### ** Examples

data(udca)
# values found in table 8.3 of the book
fit1 <- coxph(Surv(futime, status) ~ trt + log(bili) + stage +
          cluster(id), data=udca1)
fit2 <- coxph(Surv(futime, status) ~ trt + log(bili) + stage +
          cluster(id) + strata(endpoint), data=udca2)




