library(Dowd)


### Name: LogNormalES
### Title: ES for normally distributed geometric returns
### Aliases: LogNormalES

### ** Examples

# Computes ES given geometric return data
   data <- runif(5, min = 0, max = .2)
   LogNormalES(returns = data, investment = 5, cl = .95, hp = 90)

   # Computes ES given mean and standard deviation of return data
   LogNormalES(mu = .012, sigma = .03, investment = 5, cl = .95, hp = 90)



