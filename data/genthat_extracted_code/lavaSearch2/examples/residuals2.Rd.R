library(lavaSearch2)


### Name: residuals2
### Title: Extract Corrected Residuals
### Aliases: residuals2 residuals2.lm2 residuals2.gls2 residuals2.lme2
###   residuals2.lvmfit2

### ** Examples

## simulate data
set.seed(10)
m <- lvm(Y1~eta,Y2~eta,Y3~eta)
latent(m) <- ~eta
d <- lava::sim(m,20, latent = FALSE)

## standard linear model
e.lm <- lm(Y1~Y2, data = d)
sCorrect(e.lm) <- TRUE

sigma(e.lm)^2
mean(residuals(e.lm)^2)
mean(residuals2(e.lm)^2)

## latent variable model
e.lvm <- estimate(m, data = d)
sCorrect(e.lvm) <- TRUE
mean(residuals2(e.lvm)^2)




