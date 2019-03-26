library(gamlss)


### Name: getPEF
### Title: Getting the partial effect function from a continuous term in a
###   GAMLSS model
### Aliases: getPEF
### Keywords: regression

### ** Examples

m1 <- gamlss(R~pb(Fl)+pb(A), data=rent, family=GA)
# getting the Partial Efect function
pef <- getPEF(obj=m1,term="A", plot=TRUE)
# the value at 1980
pef(1980)
# the first derivative at 1980
pef(1980, deriv=1)
# the second derivative at 1980
pef(1980, deriv=2)
# plotting the first derivative
curve(pef(x, deriv=1), 1900,2000)



