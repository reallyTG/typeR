library(intubate)


### Name: arm
### Title: Interfaces for arm package for data science pipelines.
### Aliases: ntbt_bayesglm ntbt_bayespolr
### Keywords: intubate magrittr arm bayesglm bayespolr

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(arm)
##D 
##D ## ntbt_bayesglm: Bayesian generalized linear models
##D n <- 100
##D x1 <- rnorm (n)
##D x2 <- rbinom (n, 1, .5)
##D b0 <- 1
##D b1 <- 1.5
##D b2 <- 2
##D y <- rbinom(n, 1, invlogit(b0+b1*x1+b2*x2))
##D 
##D dta <- data.frame(y, x1, x2)
##D 
##D ## Original function to interface
##D bayesglm(y ~ x1 + x2, family = binomial(link="logit"), data = dta,
##D          prior.scale = Inf, prior.df = Inf)
##D 
##D ## The interface puts data as first parameter
##D ntbt_bayesglm(dta, y ~ x1 + x2, family = binomial(link="logit"),
##D               prior.scale = Inf, prior.df = Inf)
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_bayesglm(y ~ x1 + x2, family = binomial(link="logit"),
##D                 prior.scale = Inf, prior.df = Inf)
##D 
##D 
##D ## ntbt_bayespolr: Bayesian Ordered Logistic or Probit Regression
##D ## Original function to interface
##D bayespolr(Sat ~ Infl + Type + Cont, weights = Freq, data = housing,
##D           prior.scale = Inf, prior.df = Inf)
##D 
##D ## The interface puts data as first parameter
##D ntbt_bayespolr(housing, Sat ~ Infl + Type + Cont, weights = Freq,
##D                prior.scale = Inf, prior.df = Inf)
##D 
##D ## so it can be used easily in a pipeline.
##D housing %>%
##D   ntbt_bayespolr(Sat ~ Infl + Type + Cont, weights = Freq,
##D                  prior.scale = Inf, prior.df = Inf)
## End(Not run)



