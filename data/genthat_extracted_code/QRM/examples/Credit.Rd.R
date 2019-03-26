library(QRM)


### Name: Credit
### Title: Credit Risk Modelling
### Aliases: Credit cal.beta cal.claytonmix cal.probitnorm dclaytonmix
###   pclaytonmix rclaytonmix dprobitnorm pprobitnorm rprobitnorm
###   rlogitnorm rtcopulamix fit.binomial fit.binomialBeta
###   fit.binomialLogitnorm fit.binomialProbitnorm momest rbinomial.mixture
### Keywords: models

### ** Examples

## calibrating models
pi.B <- 0.2
pi2.B <- 0.05 
probitnorm.pars <- cal.probitnorm(pi.B, pi2.B) 
probitnorm.pars 
beta.pars <- cal.beta(pi.B, pi2.B) 
beta.pars 
claytonmix.pars <- cal.claytonmix(pi.B, pi2.B) 
claytonmix.pars 
q <- (1:1000) / 1001 
q <- q[q < 0.25] 
p.probitnorm <- pprobitnorm(q, probitnorm.pars[1],
                            probitnorm.pars[2]) 
p.beta <- pbeta(q, beta.pars[1], beta.pars[2]) 
p.claytonmix <- pclaytonmix(q, claytonmix.pars[1],
                            claytonmix.pars[2]) 
scale <- range((1 - p.probitnorm), (1 - p.beta), (1 - p.claytonmix)) 
plot(q, (1 - p.probitnorm), type = "l", log = "y", xlab = "q", 
           ylab = "P(Q > q)",ylim=scale) 
lines(q, (1 - p.beta), col = 2) 
lines(q, (1 - p.claytonmix), col = 3) 
legend("topright", c("Probit-normal", "Beta", "Clayton-Mixture"), 
          lty=rep(1,3),col = (1:3))
## Clayton Mix
pi.B <- 0.0489603 
pi2.B <- 0.003126529 
claytonmix.pars <- cal.claytonmix(pi.B, pi2.B)
claytonmix.pars
q <- (1:1000) / 1001
q <- q[q < 0.25]
d.claytonmix <- dclaytonmix(q, claytonmix.pars[1], claytonmix.pars[2])
head(d.claytonmix)
## SP Data
data(spdata.raw) 
attach(spdata.raw) 
BdefaultRate <- Bdefaults / Bobligors 
## Binomial Model
mod1a <- fit.binomial(Bdefaults, Bobligors)
## Binomial Logitnorm Model
mod1b <- fit.binomialLogitnorm(Bdefaults, Bobligors) 
## Binomial Probitnorm Model
mod1c <- fit.binomialProbitnorm(Bdefaults, Bobligors)
## Binomial Beta Model
mod1d <- fit.binomialBeta(Bdefaults, Bobligors); 
## Moment estimates for default probabilities
momest(Bdefaults, Bobligors)
pi.B <- momest(Bdefaults, Bobligors)[1]
pi2.B <- momest(Bdefaults, Bobligors)[2]
## Probitnorm
probitnorm.pars <- cal.probitnorm(pi.B, pi2.B) 
q <- (1:1000)/1001
q <- q[ q < 0.25]
d.probitnorm <- dprobitnorm(q, probitnorm.pars[1], probitnorm.pars[2])
p <- c(0.90,0.95,0.975,0.99,0.995,0.999,0.9999,0.99999,0.999999)
sigma <- 0.2 * 10000 / sqrt(250)
VaR.t4 <- qst(p, df = 4, sd = sigma, scale = TRUE)
VaR.t4
detach(spdata.raw)
## Binomial Mixture Models
pi <- 0.04896 
pi2 <- 0.00321 
beta.pars <- cal.beta(pi, pi2)
probitnorm.pars <- cal.probitnorm(pi, pi2) 
n <- 1000 
m <- rep(500, n) 
mod2a <- rbinomial.mixture(n, m, "beta", shape1 = beta.pars[1],
                          shape2 = beta.pars[2]) 
mod2b <- rbinomial.mixture(n, m, "probitnorm",
                          mu = probitnorm.pars[1],
                          sigma = probitnorm.pars[2])



