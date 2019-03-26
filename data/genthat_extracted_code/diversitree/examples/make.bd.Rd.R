library(diversitree)


### Name: make.bd
### Title: Constant Rate Birth-Death Models
### Aliases: make.bd make.yule starting.point.bd
### Keywords: models

### ** Examples

## Simulate a tree under a constant rates birth-death model and look at
## the maximum likelihood speciation/extinction parameters:
set.seed(1)
phy <- trees(c(.1, .03), "bd", max.taxa=25)[[1]]
lik <- make.bd(phy)

## By default, optimisation gives a lambda close to 0.1 and extremely
## small mu:
fit <- find.mle(lik, c(.1, .03))
coef(fit)

## The above optimisation uses the algorithm nlm for
## compatibility with ape's birthdeath.  This can be slightly
## improved by using optim for the optimisation, which allows
## bounds to be specified:
fit.o <- find.mle(lik, c(.1, .03), method="optim", lower=0)
coef(fit.o)

logLik(fit.o) - logLik(fit) # slight improvement

## Special case methods are worked out for the Yule model, for which
## analytic solutions are available.  Compare a direct fit of the Yule
## model with one where mu is constrained to be zero:
lik.yule <- make.yule(phy)
lik.mu0 <- constrain(lik, mu ~ 0)

## The same to a reasonable tolerance:
fit.yule <- find.mle(lik.yule, .1)
fit.mu0 <- find.mle(lik.mu0, .1)
all.equal(fit.yule[1:2], fit.mu0[1:2], tolerance=1e-6)

## There is no significant improvement in the fit by including the mu
## parameter (unsurprising as the ML value was zero)
anova(fit.o, yule=fit.yule)

## Optimisation can be done without conditioning on survival:
fit.nosurv <- find.mle(lik, c(.1, .03), method="optim", lower=0,
                       condition.surv=FALSE)
coef(fit.nosurv) # higher lambda than before

## Look at the marginal likelihoods, computed through MCMC (see
## mcmc for details, and increase nsteps for smoother
## plots [takes longer]).
samples <- mcmc(lik, fit$par, nsteps=500,
                lower=c(-Inf, -Inf), upper=c(Inf, Inf), w=c(.1, .1),
                fail.value=-Inf, print.every=100)
samples$r <- with(samples, lambda - mu)

## Plot the profiles (see profiles.plot).
## The vertical lines are the simulated parameters, which match fairly
## well with the estimated ones.
col <- c("red", "blue", "green3")
profiles.plot(samples[c("lambda", "mu", "r")], col.line=col, las=1,
              legend="topright")
abline(v=0, lty=2)
abline(v=c(.1, .03, .07), col=col)

## Sample the phylogeny to include 20 of the species, and run the
## likelihood search assuming random sampling:
set.seed(1)
phy2 <- drop.tip(phy, sample(25, 5))
lik2 <- make.bd(phy2, sampling.f=20/25)
fit2 <- find.mle(lik2, c(.1, .03))

## The ODE based version gives comparable results.  However, it is
## about 55x slower.
lik.ode <- make.bd(phy, control=list(method="ode"))
all.equal(lik.ode(coef(fit)), lik(coef(fit)), tolerance=2e-7)



