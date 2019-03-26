library(glmx)


### Name: glmx
### Title: Generalized Linear Models with Extra Parameters
### Aliases: glmx glmx.fit coef.glmx formula.glmx logLik.glmx nobs.glmx
###   print.glmx summary.glmx vcov.glmx predict.glmx
### Keywords: regression

### ** Examples

## artificial data from geometric regression
set.seed(1)
d <- data.frame(x = runif(200, -1, 1))
d$y <- rnbinom(200, mu = exp(0 + 3 * d$x), size = 1)

### negative binomial regression ###

## negative binomial regression via glmx
if(require("MASS")) {
m_nb1 <- glmx(y ~ x, data = d,
  family = negative.binomial, xlink = "log", xstart = 0)
summary(m_nb1)

## negative binomial regression via MASS::glm.nb
m_nb2 <- glm.nb(y ~ x, data = d)
summary(m_nb2)

## comparison
if(require("lmtest")) {
logLik(m_nb1)
logLik(m_nb2)
coeftest(m_nb1)
coeftest(m_nb2)
exp(coef(m_nb1, model = "extra"))
m_nb2$theta
exp(coef(m_nb1, model = "extra")) * sqrt(vcov(m_nb1, model = "extra"))
m_nb2$SE.theta
}}

## if the score (or gradient) contribution of the extra parameters
## is supplied, then estimation can be speeded up:
negbin <- function(theta) {
  fam <- negative.binomial(theta)
  fam$loglik.extra <- function(y, mu, theta) digamma(y + theta) - digamma(theta) +
    log(theta) + 1 - log(mu + theta) - (y + theta)/(mu + theta)
  fam
}
m_nb3 <- glmx(y ~ x, data = d,
  family = negbin, xlink = "log", xstart = 0, profile = FALSE)
all.equal(coef(m_nb1), coef(m_nb3))


### censored negative binomial hurdle regression (0 vs. > 0) ###

## negative binomial zero hurdle part via glmx
nbbin <- function(theta) binomial(link = nblogit(theta))
m_hnb1 <- glmx(factor(y > 0) ~ x, data = d,
  family = nbbin, xlink = "log", xstart = 0)
summary(m_hnb1)

## negative binomial hurdle regression via pscl::hurdle
## (see only zero hurdle part)
if(require("pscl")) {
m_hnb2 <- hurdle(y ~ x, data = d, dist = "negbin", zero.dist = "negbin")
summary(m_hnb2)
}



