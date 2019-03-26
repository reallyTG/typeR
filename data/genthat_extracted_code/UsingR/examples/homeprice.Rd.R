library(UsingR)


### Name: homeprice
### Title: Sale price of homes in New Jersey in the year 2001
### Aliases: homeprice
### Keywords: datasets

### ** Examples

data(homeprice)
plot(homeprice$sale,homeprice$list)
abline(lm(homeprice$list~homeprice$sale))



