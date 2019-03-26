library(drc)


### Name: finney71
### Title: Example from Finney (1971)
### Aliases: finney71
### Keywords: datasets

### ** Examples


## Model with ED50 as a parameter
finney71.m1 <- drm(affected/total ~ dose, weights = total,
data = finney71, fct = LL.2(), type = "binomial")

summary(finney71.m1)
plot(finney71.m1, broken = TRUE, bp = 0.1, lwd = 2)

ED(finney71.m1, c(10, 20, 50), interval = "delta", reference = "control")

## Model fitted with 'glm'
#fitl.glm <- glm(cbind(affected, total-affected) ~ log(dose),
#family=binomial(link = logit), data=finney71[finney71$dose != 0, ])
#summary(fitl.glm)  # p-value almost agree for the b parameter
#
#xp <- dose.p(fitl.glm, p=c(0.50, 0.90, 0.95))  # from MASS
#xp.ci <- xp + attr(xp, "SE") %*% matrix(qnorm(1 - 0.05/2)*c(-1,1), nrow=1)
#zp.est <- exp(cbind(xp.ci[,1],xp,xp.ci[,2]))
#dimnames(zp.est)[[2]] <- c("zp.lcl","zp","zp.ucl")
#zp.est  # not far from above results with 'ED'

## Model with log(ED50) as a parameter
finney71.m2 <- drm(affected/total ~ dose, weights = total,
data = finney71, fct = LL2.2(), type = "binomial")

## Confidence intervals based on back-transformation
##  complete agreement with results based on 'glm'
ED(finney71.m2, c(10, 20, 50), interval = "fls", reference = "control")




