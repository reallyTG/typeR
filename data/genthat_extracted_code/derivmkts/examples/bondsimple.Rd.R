library(derivmkts)


### Name: bondsimple
### Title: Simple Bond Functions
### Aliases: bondsimple bondpv bondyield duration convexity

### ** Examples

coupon <- 6; mat <- 20; freq <- 2; principal <- 100; yield <- 0.045;

price <- bondpv(coupon, mat, yield, principal, freq) # 119.7263
bondyield(coupon, mat, price=price, principal, freq) # 0.045
duration(price, coupon, mat, principal, freq, modified=FALSE) # 12.5043
duration(price, coupon, mat, principal, freq, modified=TRUE) # 12.3928
convexity(price, coupon, mat, principal, freq) # 205.3245




