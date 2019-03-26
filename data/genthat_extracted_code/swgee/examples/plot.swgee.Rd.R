library(swgee)


### Name: plot.swgee
### Title: plot.swgee
### Aliases: plot.swgee

### ** Examples

require(gee)
require(mvtnorm)
data(BMI)
bmidata <- BMI

rho <- 0
sigma1 <- 0.5
sigma2 <- 0.5

sigma <- matrix(0,2,2)
sigma[1,1] <- sigma1*sigma1
sigma[1,2] <- rho*sigma1*sigma2
sigma[2,1] <- sigma[1,2]
sigma[2,2] <- sigma2*sigma2

set.seed(1000)
##swgee method ##########
output2 <- swgee(bbmi~sbp+chol+age, data = bmidata, id = id, 
            family = binomial(link="logit"),corstr = "independence", 
            missingmodel = O~bbmi+sbp+chol+age, SIMEXvariable = c("sbp","chol"), 
            SIMEX.err = sigma, repeated = FALSE, B = 20, lambda = seq(0, 2, 0.5))

summary(output2)

plot(output2,"sbp")





