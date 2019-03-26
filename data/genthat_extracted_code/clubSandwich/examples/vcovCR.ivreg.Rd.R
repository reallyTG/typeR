library(clubSandwich)


### Name: vcovCR.ivreg
### Title: Cluster-robust variance-covariance matrix for an ivreg object.
### Aliases: vcovCR.ivreg

### ** Examples

library(AER)
data("CigarettesSW")
Cigs <- within(CigarettesSW, {
  rprice <- price/cpi
  rincome <- income/population/cpi
  tdiff <- (taxs - tax)/cpi
})

iv_fit <- ivreg(log(packs) ~ log(rprice) + log(rincome) | 
                log(rincome) + tdiff + I(tax/cpi), data = Cigs)
vcovCR(iv_fit, cluster = Cigs$state, type = "CR2")
coef_test(iv_fit, vcov = "CR2", cluster = Cigs$state)
      



