library(Dowd)


### Name: tVaR
### Title: VaR for t distributed P/L
### Aliases: tVaR

### ** Examples

# Computes VaR given P/L data
   data <- runif(5, min = 0, max = .2)
   tVaR(returns = data, df = 6, cl = .95, hp = 90)

   # Computes VaR given mean and standard deviation of P/L data
   tVaR(mu = .012, sigma = .03, df = 6, cl = .95, hp = 90)



