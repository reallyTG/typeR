library(robcbi)


### Name: QQline
### Title: Add a theoretical QQ-line in a plot
### Aliases: QQline
### Keywords: stats

### ** Examples

library(robcbi)
data(Finney)
Vol  <- Finney$Vol; Rate <- Finney$Rate; Resp <- Finney$Resp
lVol <-log(Vol); lRate <- log(Rate)
z.cub <- glm(Resp~lVol+lRate,family=binomial,method="cubinf", ufact=3.2)
x    <- residuals(z.cub, type="deviance")
## Not run: 
##D qqnorm(x, ylab = "Deviance Residuals")
##D QQline(x, lty = 2)
## End(Not run)



