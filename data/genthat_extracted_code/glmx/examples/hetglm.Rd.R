library(glmx)


### Name: hetglm
### Title: Heteroskedastic Binary Response GLMs
### Aliases: hetglm hetglm.fit print.hetglm summary.hetglm
###   print.summary.hetglm predict.hetglm coef.hetglm vcov.hetglm
###   bread.hetglm estfun.hetglm coeftest.hetglm logLik.hetglm terms.hetglm
###   model.frame.hetglm model.matrix.hetglm residuals.hetglm update.hetglm
### Keywords: regression

### ** Examples

## Generate artifical binary data from a latent
## heteroskedastic normally distributed variable
set.seed(48)
n <- 200
x <- rnorm(n)
ystar <- 1 + x +  rnorm(n, sd = exp(x))
y  <- factor(ystar > 0) 

## visualization
par(mfrow = c(1, 2))
plot(ystar ~ x, main = "latent")
abline(h = 0, lty = 2)
plot(y ~ x, main = "observed")

## model fitting of homoskedastic model (m0a/m0b)
## and heteroskedastic model (m)
m0a <- glm(y ~ x, family = binomial(link = "probit"))
m0b <- hetglm(y ~ x | 1)
m <- hetglm(y ~ x)

## coefficient estimates
cbind(heteroskedastic = coef(m),
  homoskedastic = c(coef(m0a), 0))

## summary of correct heteroskedastic model
summary(m)



## Generate artificial binary data with a single binary regressor
## driving the heteroskedasticity in a model with two regressors
set.seed(48)
n <- 200
x <- rnorm(n)
z <- rnorm(n)
a <- factor(sample(1:2, n, replace = TRUE))
ystar <- 1 + c(0, 1)[a] + x + z + rnorm(n, sd = c(1, 2)[a])
y  <- factor(ystar > 0) 

## fit "true" heteroskedastic model
m1 <- hetglm(y ~ a + x + z | a)

## fit interaction model
m2 <- hetglm(y ~ a/(x + z) | 1)

## although not obvious at first sight, the two models are
## nested. m1 is a restricted version of m2 where the following
## holds: a1:x/a2:x == a1:z/a2:z
if(require("lmtest")) lrtest(m1, m2)

## both ratios are == 2 in the data generating process
c(x = coef(m2)[3]/coef(m2)[4], z = coef(m2)[5]/coef(m2)[6])



if(require("AER")) {

## Labor force participation example from Greene
## (5th edition: Table 21.3, p. 682)
## (6th edition: Table 23.4, p. 790)

## data (including transformations)
data("PSID1976", package = "AER")
PSID1976$kids <- with(PSID1976, factor((youngkids + oldkids) > 0,
  levels = c(FALSE, TRUE), labels = c("no", "yes")))
PSID1976$fincome <- PSID1976$fincome/10000

## Standard probit model via glm()
lfp0a <- glm(participation ~ age + I(age^2) + fincome + education + kids,
  data = PSID1976, family = binomial(link = "probit"))

## Standard probit model via hetglm() with constant scale
lfp0b <- hetglm(participation ~ age + I(age^2) + fincome + education + kids | 1,
  data = PSID1976)

## Probit model with varying scale
lfp1 <- hetglm(participation ~ age + I(age^2) + fincome + education + kids | kids + fincome,
  data = PSID1976)

## Likelihood ratio and Wald test
lrtest(lfp0b, lfp1)
waldtest(lfp0b, lfp1)

## confusion matrices
table(true = PSID1976$participation,
  predicted = fitted(lfp0b) <= 0.5)
table(true = PSID1976$participation,
  predicted = fitted(lfp1) <= 0.5)



## Adapted (and somewhat artificial) example to illustrate that
## certain models with heteroskedastic scale can equivalently
## be interpreted as homoskedastic scale models with interaction
## effects.

## probit model with main effects and heteroskedastic scale in two groups
m <- hetglm(participation ~ kids + fincome | kids, data = PSID1976)

## probit model with interaction effects and homoskedastic scale
p <- glm(participation ~ kids * fincome, data = PSID1976,
   family = binomial(link = "probit"))

## both likelihoods are equivalent
logLik(m)
logLik(p)

## intercept/slope for the kids=="no" group
coef(m)[c(1, 3)]
coef(p)[c(1, 3)]

## intercept/slope for the kids=="yes" group
c(sum(coef(m)[1:2]), coef(m)[3]) / exp(coef(m)[4])
coef(p)[c(1, 3)] + coef(p)[c(2, 4)]

## Wald tests for the heteroskedasticity effect in m and the 
## interaction effect in p are very similar
coeftest(m)[4,]
coeftest(p)[4,]

## corresponding likelihood ratio tests are equivalent
## (due to the invariance of the MLE)
m0 <- hetglm(participation ~ kids + fincome | 1, data = PSID1976)
p0 <- glm(participation ~ kids + fincome, data = PSID1976,
  family = binomial(link = "probit"))
lrtest(m0, m)
lrtest(p0, p)

}



