library(plm)


### Name: cipstest
### Title: Cross-sectionally Augmented IPS Test for Unit Roots in Panel
###   Models
### Aliases: cipstest cipstest.panelmodel cipstest.formula
### Keywords: htest

### ** Examples

data("Produc", package = "plm")
Produc <- pdata.frame(Produc, index=c("state", "year"))
## check whether the gross state product (gsp) is trend-stationary
cipstest(Produc$gsp, type = "trend")



