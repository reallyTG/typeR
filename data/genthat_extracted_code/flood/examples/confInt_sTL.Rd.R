library(flood)


### Name: confInt_sTL
### Title: Estimated confidence intervals using sTL
### Aliases: confInt_sTL

### ** Examples

library("evd")
# Seasonal observations of 80 years at one station:
x1 <- rgev(80, 2, 1, 0.2) # observations from season 1
x2 <- rgev(80, 3, 1, 0.3) # observations from season 2
confInt_sTL(x1=x1, x2=x2, p=0.95, alpha=0.05)

# Seasonal observations of 100 years at 4 stations:
x1 <- matrix(rgev(400, 2, 1, 0.3), ncol=4)
x2 <- matrix(rgev(400, 4, 1, 0.2), ncol=4)
confInt_sTL(x1=x1, x2=x2, j=2, p=0.95, alpha=0.05)



