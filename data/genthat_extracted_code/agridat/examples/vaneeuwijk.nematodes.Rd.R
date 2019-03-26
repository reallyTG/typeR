library(agridat)


### Name: vaneeuwijk.nematodes
### Title: Number of cysts on 11 potato genotypes for 5 potato cyst
###   nematode populations.
### Aliases: vaneeuwijk.nematodes
### Keywords: datasets

### ** Examples


library(agridat)
data(vaneeuwijk.nematodes)
dat <- vaneeuwijk.nematodes

# show non-normality
op <- par(mfrow=c(2,1), mar=c(5,4,3,2))
boxplot(y ~ pop, data=dat, las=2,
        ylab="number of cysts")
title("vaneeuwijk.nematodes - cysts per nematode pop")
boxplot(y ~ gen, data=dat, las=2)
title("vaneeuwijk.nematodes - cysts per potato")
par(op)

## Not run: 
##D   # normal distribution
##D   lm1 <- lm(y ~ gen + pop, data=dat)
##D 
##D   # poisson distribution
##D   glm1 <- glm(y ~ gen+pop,data=dat,family=quasipoisson(link=log))
##D   anova(glm1)
##D 
##D   require(gnm)
##D 
##D   # main-effects non-interaction model
##D   gnm0 <- gnm(y ~ pop + gen, data=dat,
##D               family=quasipoisson(link=log))
##D   # one interaction
##D   gnm1 <- gnm(y ~ pop + gen + Mult(pop,gen,inst=1), data=dat,
##D               family=quasipoisson(link=log))
##D   # two interactions
##D   gnm2 <- gnm(y ~ pop + gen + Mult(pop,gen,inst=1) + Mult(pop,gen,inst=2),
##D               data=dat,
##D               family=quasipoisson(link=log))
##D 
##D   # anova(gnm0, gnm1, gnm2, test="F")
##D   # only 2, not 3 axes needed
##D 
##D   # match vaneeuwijk table 2
##D   anova(gnm2)
##D   ##                          Df Deviance Resid. Df Resid. Dev
##D   ## NULL                                        54     8947.4
##D   ## pop                       4    690.6        50     8256.8
##D   ## gen                      10   7111.4        40     1145.4
##D   ## Mult(pop, gen, inst = 1) 13    716.0        27      429.4
##D   ## Mult(pop, gen, inst = 2) 11    351.1        16       78.3
##D 
##D   # compare residual qq plots from models
##D   op <- par(mfrow=c(2,2))
##D   plot(lm1, which=2, main="LM")
##D   plot(glm1, which=2, main="GLM")
##D   plot(gnm0, which=2, main="GNM, no interaction")
##D   plot(gnm2, which=2, main="GNM, 2 interactions")
##D   par(op)
##D 
##D   # extract interaction-term coefficients, make a biplot
##D   pops <- pickCoef(gnm2, "[.]pop")
##D   gens <- pickCoef(gnm2, "[.]gen")
##D   coefs <- coef(gnm2)
##D   A <- matrix(coefs[pops], nc = 2)
##D   B <- matrix(coefs[gens], nc = 2)
##D   A2=scale(A)
##D   B2=scale(B)
##D   rownames(A2) <- levels(dat$pop)
##D   rownames(B2) <- levels(dat$gen)
##D   # near-match with vaneeuwijk figure 1
##D   biplot(A2,B2, expand=2.5,xlim=c(-2,2),ylim=c(-2,2),
##D          main="vaneeuwijk.nematodes - GAMMI biplot")
##D 
## End(Not run)



