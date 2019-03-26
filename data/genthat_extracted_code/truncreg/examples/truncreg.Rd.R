library(truncreg)


### Name: truncreg
### Title: Truncated Gaussian Response Models
### Aliases: truncreg coef.truncreg fitted.truncreg logLik.truncreg
###   model.frame.truncreg model.matrix.truncreg predict.truncreg
###   print.truncreg residuals.truncreg summary.truncreg
###   print.summary.truncreg vcov.truncreg
### Keywords: regression

### ** Examples

########################
## Artificial example ##
########################

## simulate a data.frame
set.seed(1071)
n <- 10000
sigma <- 4
alpha <- 2
beta <- 1
x <- rnorm(n, mean = 0, sd = 2)
eps <- rnorm(n, sd = sigma)
y <- alpha + beta * x + eps
d <- data.frame(y = y, x = x)

## truncated response
d$yt <- ifelse(d$y > 1, d$y, NA)

## binary threshold response
d$yb <- factor(d$y > 0)

## censored response
d$yc <- pmax(1, d$y)

## compare estimates for full/truncated/censored/threshold response
fm_full <- lm(y ~ x, data = d)
fm_trunc <- truncreg(yt ~ x, data = d, point = 1, direction = "left")
fm_thresh <- glm(yb ~ x, data = d, family = binomial(link = "probit"))
library("survival")
fm_cens <- survreg(Surv(yc, yc > 1, type = "left") ~ x, data = d, dist = "gaussian")

## compare scaled regression coefficients
cbind(
  "True"      = c(alpha, beta) / sigma,
  "Full"      = coef(fm_full) / summary(fm_full)$sigma,
  "Truncated" = coef(fm_trunc)[1:2] / coef(fm_trunc)[3],
  "Censored"  = coef(fm_cens) / fm_cens$scale,
  "Threshold" = coef(fm_thresh)
)


################################
## Tobin's durable goods data ##
################################

## Tobit model (Tobin 1958)
data("tobin", package = "survival")
tobit <- survreg(Surv(durable, durable > 0, type = "left") ~ age + quant,
  data = tobin, dist = "gaussian")

## Two-part model (Cragg 1971)
## (see "mhurdle" package for a combined solution)
cragg_probit <- glm(factor(durable > 0) ~ age + quant,
  data = tobin, family = binomial(link = "logit"))
cragg_trunc <- truncreg(durable ~ age + quant, data = tobin, subset = durable > 0)

## Scaled coefficients
cbind(
  "Tobit"     = coef(tobit) / tobit$scale,
  "Binary"    = coef(cragg_probit),
  "Truncated" = coef(cragg_trunc)[1:3] / coef(cragg_trunc)[4])

## likelihood ratio test and BIC
ll <- c("Tobit" = tobit$loglik[1],
        "Two-Part" = as.vector(logLik(cragg_probit) + logLik(cragg_trunc)))
df <- c(4, 3 + 4)
pchisq(2 * diff(ll), diff(df), lower.tail = FALSE)
-2 * ll + log(nrow(tobin)) * df



