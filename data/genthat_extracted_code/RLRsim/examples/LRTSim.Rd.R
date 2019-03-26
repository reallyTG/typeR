library(RLRsim)


### Name: LRTSim
### Title: Simulation of the (Restricted) Likelihood Ratio Statistic
### Aliases: LRTSim RLRTSim
### Keywords: datagen distribution

### ** Examples


library(lme4)
g <- rep(1:10, e = 10)
x <- rnorm(100)
y <- 0.1 * x + rnorm(100)
m <- lmer(y ~ x + (1|g), REML=FALSE)
m0 <- lm(y ~ 1)

(obs.LRT <- 2*(logLik(m)-logLik(m0)))
X <- getME(m,"X")
Z <- t(as.matrix(getME(m,"Zt")))
sim.LRT <- LRTSim(X, Z, 1, diag(10))
(pval <- mean(sim.LRT > obs.LRT))




