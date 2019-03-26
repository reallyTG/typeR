library(survMisc)


### Name: predict
### Title: predicted events
### Aliases: predict predict.ten

### ** Examples

## K&M. Example 7.2, Table 7.2, pp 209-210.
data("kidney", package="KMsurv")
k1 <- ten(Surv(time=time, event=delta) ~ type, data=kidney)
predict(k1)
predict(asWide(k1))
stopifnot(predict(asWide(k1))[, sum(eMP_1 + eMP_2)] <=
          .Machine$double.neg.eps)
## Three covariate groups
## K&M. Example 7.4, pp 212-214.
data("bmt", package="KMsurv")
b1 <- ten(Surv(time=t2, event=d3) ~ group, data=bmt)
predict(b1)
## one group only
predict(ten(Surv(time=t2, event=d3) ~ 1, data=bmt))




