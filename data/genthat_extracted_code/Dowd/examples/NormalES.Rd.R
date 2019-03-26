library(Dowd)


### Name: NormalES
### Title: ES for normally distributed P/L
### Aliases: NormalES

### ** Examples

# Computes VaR given P/L
   data <- runif(5, min = 0, max = .2)
   NormalES(returns = data, cl = .95, hp = 90)

   # Computes VaR given mean and standard deviation of P/L data
   NormalES(mu = .012, sigma = .03, cl = .95, hp = 90)



