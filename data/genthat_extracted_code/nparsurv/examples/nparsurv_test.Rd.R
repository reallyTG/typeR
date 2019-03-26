library(nparsurv)


### Name: nparsurv_test
### Title: Nonparametric Tests for Main Effects, Simple Effects and
###   Interaction Effect in a Two-Factorial Design with Censored Data
### Aliases: nparsurv_test

### ** Examples

data_ovarian<-data.frame(survival::ovarian$futime,
                       survival::ovarian$fustat,
                       as.factor(survival::ovarian$resid.ds),
                       as.factor(survival::ovarian$rx))
nparsurv_test(data_ovarian)

data_GBSG2<-data.frame(TH.data::GBSG2$time,
                       TH.data::GBSG2$cens,
                       TH.data::GBSG2$tgrade,
                       TH.data::GBSG2$horTh)
nparsurv_test(data_GBSG2)




