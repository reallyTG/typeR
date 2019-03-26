library(lavaSearch2)


### Name: leverage2
### Title: Extract Leverage Values
### Aliases: leverage2 leverage2.lm leverage2.gls leverage2.lme
###   leverage2.lvmfit leverage2.lm2 leverage2.gls2 leverage2.lme2
###   leverage2.lvmfit2

### ** Examples

## simulate data
set.seed(10)
m <- lvm(Y1~eta,Y2~eta,Y3~eta)
latent(m) <- ~eta
d <- lava::sim(m,20, latent = FALSE)

## standard linear model
e.lm <- lm(Y1~Y2, data = d)

sCorrect(e.lm) <- TRUE
range(as.double(leverage2(e.lm)) - influence(e.lm)$hat)

## latent variable model
e.lvm <- estimate(m, data = d)
sCorrect(e.lvm) <- TRUE
leverage2(e.lvm)




