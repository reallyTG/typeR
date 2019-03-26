library(flood)


### Name: confInt_W
### Title: Estimated confidence intervals using W
### Aliases: confInt_W

### ** Examples

library("evd")
# Seasonal observations of 80 years at one station:
x1 <- rgev(80, 2, 1, 0.2) # observations from season 1
x2 <- rgev(80, 3, 1, 0.3) # observations from season 2
x <- seas2ann(x1, x2) # calculaes annual maxima of the two seasons
confInt_W(x=x, p=0.95, alpha=0.05)

# Seasonal observations of 100 years at 4 stations:
x1 <- matrix(rgev(400, 2, 1, 0.3), ncol=4) # observations from season 1
x2 <- matrix(rgev(400, 2, 1, 0.2), ncol=4) # observations from season 2
x <- seas2ann(x1, x2) # calculaes annual maxima of the two seasons
confInt_W(x=x, j=2, p=0.95, alpha=0.05)



