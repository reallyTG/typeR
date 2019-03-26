library(Dowd)


### Name: LogtVaR
### Title: VaR for t distributed geometric returns
### Aliases: LogtVaR

### ** Examples

# Computes VaR given geometric return data
   data <- runif(5, min = 0, max = .2)
   LogtVaR(returns = data, investment = 5, df = 6, cl = .95, hp = 90)

   # Computes VaR given mean and standard deviation of return data
   LogtVaR(mu = .012, sigma = .03, investment = 5, df = 6, cl = .95, hp = 90)



