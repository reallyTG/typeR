library(Dowd)


### Name: tES
### Title: ES for t distributed P/L
### Aliases: tES

### ** Examples

# Computes ES given P/L data
   data <- runif(5, min = 0, max = .2)
   tES(returns = data, df = 6, cl = .95, hp = 90)

   # Computes ES given mean and standard deviation of P/L data
   tES(mu = .012, sigma = .03, df = 6, cl = .95, hp = 90)



