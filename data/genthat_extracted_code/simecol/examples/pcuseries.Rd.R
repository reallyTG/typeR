library(simecol)


### Name: pcuseries
### Title: Generate Plackett Bivariate Random Numbers
### Aliases: pcuseries pcu rho2alpha alpha2rho
### Keywords: distribution

### ** Examples

x <- runif(100)
y <- pcu(x, rho = 0.8)
plot(x, y)
cor(x, y)

x <- pcuseries(1000, rho=0.8)
plot(x, type="l")
acf(x)
pacf(x)



