library(Dowd)


### Name: LogNormalVaR
### Title: VaR for normally distributed geometric returns
### Aliases: LogNormalVaR

### ** Examples

# Computes VaR given geometric return data
   data <- runif(5, min = 0, max = .2)
   LogNormalVaR(returns = data, investment = 5, cl = .95, hp = 90)

   # Computes VaR given mean and standard deviation of return data
   LogNormalVaR(mu = .012, sigma = .03, investment = 5, cl = .95, hp = 90)



