library(lavaSearch2)


### Name: conditionalMoment
### Title: Prepare the Computation of score2
### Aliases: conditionalMoment conditionalMoment.lm conditionalMoment.gls
###   conditionalMoment.lme conditionalMoment.lvm conditionalMoment.lvmfit
### Keywords: internal

### ** Examples

m <- lvm(Y1~eta,Y2~eta,Y3~eta)
latent(m) <- ~eta

d <- lava::sim(m,1e2)
e <- estimate(m, d)

## basic pre-computation
res1 <- conditionalMoment(e, data = d,
                         first.order = FALSE, second.order = FALSE,
                         name.endogenous = endogenous(e),
                         name.latent = latent(e), usefit = FALSE)
res1$skeleton$Sigma

## full pre-computation
res2 <- conditionalMoment(e, param = coef(e), data = d,
                         first.order = FALSE, second.order = FALSE,
                         name.endogenous = endogenous(e),
                         name.latent = latent(e), usefit = TRUE
)
res2$value$Sigma




