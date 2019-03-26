library(Dowd)


### Name: LogtES
### Title: ES for t distributed geometric returns
### Aliases: LogtES

### ** Examples

# Computes ES given geometric return data
   data <- runif(5, min = 0, max = .2)
   LogtES(returns = data, investment = 5, df = 6, cl = .95, hp = 90)

   # Computes ES given mean and standard deviation of return data
   LogtES(mu = .012, sigma = .03, investment = 5, df = 6, cl = .95, hp = 90)



