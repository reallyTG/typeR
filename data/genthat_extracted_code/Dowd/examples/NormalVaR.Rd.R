library(Dowd)


### Name: NormalVaR
### Title: VaR for normally distributed P/L
### Aliases: NormalVaR

### ** Examples

# Computes VaR given geometric return data
   data <- runif(5, min = 0, max = .2)
   NormalVaR(returns = data, cl = .95, hp = 90)

   # Computes VaR given mean and standard deviation of return data
   NormalVaR(mu = .012, sigma = .03, cl = .95, hp = 90)



