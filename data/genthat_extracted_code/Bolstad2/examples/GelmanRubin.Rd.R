library(Bolstad2)


### Name: GelmanRubin
### Title: Calculate the Gelman Rubin statistic
### Aliases: GelmanRubin GR

### ** Examples

## take four chains sampling from a normal mixture density
theta0 <- c(0,1)
theta1 <- c(3,2)
p <- 0.6
candidate <- c(0, 3)

v1 <- normMixMH(theta0, theta1, p, candidate, steps = 200)
v2 <- normMixMH(theta0, theta1, p, candidate, steps = 200)
v3 <- normMixMH(theta0, theta1, p, candidate, steps = 200)
v4 <- normMixMH(theta0, theta1, p, candidate, steps = 200)

theta<-cbind(v1,v2,v3,v4)
GelmanRubin(theta)



