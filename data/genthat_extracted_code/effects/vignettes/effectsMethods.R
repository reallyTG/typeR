## ----setopts,echo=FALSE--------------------------------------------------
library("knitr")
opts_chunk$set(fig.width=5,fig.height=5,tidy=TRUE,
               out.width="0.8\\textwidth",echo=TRUE)
options(prompt=" ")

## ----echo=FALSE, results='hide', include=FALSE---------------------------
#options(continue="+    ", prompt="R> ", width=76)
options(show.signif.stars=FALSE)
options(scipen=3)

## ----include=FALSE-------------------------------------------------------
library(knitr)
opts_chunk$set(
tidy=FALSE,fig.width=5,fig.height=5,cache=FALSE,comment=NA, prompt=TRUE
)
render_sweave()

## ----echo=FALSE, results='hide', include=FALSE----------------------------
options(continue="    ", prompt=" ", width=76)
options(show.signif.stars=FALSE)
options(scipen=3)


## ----eval=FALSE-----------------------------------------------------------
#  Effect.gls <- function(focal.predictors, mod, ...){
#    args <- list(
#      type = "glm",
#      call = mod$call,
#      formula = formula(mod),
#      family = family(mod),
#      coefficients = coef(mod),
#      vcov = as.matrix(vcov(mod)))
#    Effect.default(focal.predictors, mod, ..., sources=args)
#  }

## ----fig.height=4,fig.width=8---------------------------------------------
library(effects)
require(nlme)
g <- gls(Employed ~ GNP + Population,
         correlation=corAR1(form= ~ Year), data=longley)
plot(predictorEffects(g))

## ----eval=FALSE-----------------------------------------------------------
#  Effects.lme <- function(focal.predictors, mod, ...){
#    args <- list(
#      formula = mod$call$fixed,
#      coefficients = mod$coefficients$fixed,
#      vcov = mod$varFix)
#    Effect.default(focal.predictors, mod, ..., sources=args)
#  }

## -------------------------------------------------------------------------
data(Orthodont, package="nlme")
m1 <- nlme::lme(distance ~ age + Sex, data=Orthodont, 
                random= ~ 1 | Subject)
as.data.frame(Effect("age", m1))

## ----eval=FALSE-----------------------------------------------------------
#  Effect.merMod <- function(focal.predictors, mod, ..., KR=FALSE){
#    if (KR && !requireNamespace("pbkrtest", quietly=TRUE)){
#      KR <- FALSE
#      warning("pbkrtest is not available, KR set to FALSE")}
#    fam <- family(mod)
#    args <- list(
#      call = mod@call,
#      coefficients = lme4::fixef(mod),
#      family=fam,
#      vcov = if (fam == "gaussian" && fam$link == "identity" && KR)
#        as.matrix(pbkrtest::vcovAdj(mod)) else as.matrix(vcov(mod)))
#    Effect.default(focal.predictors, mod, ..., sources=args)
#  }

## ----fig.height=4,fig.width=8---------------------------------------------
fm2 <- lme4::lmer(distance ~ age + Sex + (1 |Subject), data
                  = Orthodont)
plot(allEffects(fm2))

## -------------------------------------------------------------------------
data(cbpp, package="lme4")
gm1 <- lme4::glmer(cbind(incidence, size - incidence) ~ period + (1 | herd),
              data = cbpp, family = binomial)
as.data.frame(predictorEffect("period", gm1))

## ----eval=FALSE-----------------------------------------------------------
#  Effect.rlmerMod <- function(focal.predictors, mod, ...){
#    args <- list(
#      coefficients = lme4::fixef(mod),
#      family=family(mod))
#    Effect.default(focal.predictors, mod, ..., sources=args)
#  }

## ----eval=FALSE,fig.height=4, fig.width=8---------------------------------
#  require(lme4)
#  fm3 <- robustlmm::rlmer(distance ~ age * Sex + (1 |Subject),
#                          data = Orthodont)
#  plot(predictorEffects(fm3))

## ----eval=FALSE-----------------------------------------------------------
#  Effect.betareg <- function(focal.predictors, mod, ...){
#    coef <- mod$coefficients$mean
#    vco <- vcov(mod)[1:length(coef), 1:length(coef)]
#  # betareg uses beta errors with mean link given in mod$link$mean.
#  # Construct a family based on the binomial() family
#    fam <- binomial(link=mod$link$mean)
#  # adjust the varince function to account for beta variance
#    fam$variance <- function(mu){
#      f0 <- function(mu, eta) (1-mu)*mu/(1+eta)
#      do.call("f0", list(mu, mod$coefficient$precision))}
#  # adjust initialize
#    fam$initialize <- expression({mustart <- y})
#    args <- list(
#      call = mod$call,
#      formula = formula(mod),
#      family=fam,
#      coefficients = coef,
#      vcov = vco)
#    Effect.default(focal.predictors, mod, ..., sources=args)
#  }

## ----eval=FALSE,fig.height=4,fig.width=8,cache=FALSE----------------------
#  library(betareg)
#  require(lme4)
#  data("GasolineYield", package = "betareg")
#  gy_logit <- betareg(yield ~ batch + temp, data = GasolineYield)
#  summary(gy_logit)
#  plot(predictorEffects(gy_logit))

## -------------------------------------------------------------------------
Effect.clm <- function(focal.predictors, mod, ...){
  if (requireNamespace("MASS", quietly=TRUE)){
    polr <- MASS::polr} else stop("MASS package is required")
  polr.methods <- c("logistic", "probit", "loglog", 
                    "cloglog", "cauchit")
  method <- mod$link
  if(method == "logit") method <- "logistic"
  if(!(method %in% polr.methods)) 
    stop("'link' must be a 'method' supported by polr; see help(polr)")
  if(mod$threshold != "flexible") 
    stop("Effects only supports the 'flexible' threshold")
  if(is.null(mod$Hessian)){
    message("\nRe-fitting to get Hessian\n")
    mod <- update(mod, Hess=TRUE)}
  numTheta <- length(mod$Theta)
  numBeta <- length(mod$beta)
  or <- c( (numTheta+1):(numTheta + numBeta), 1:(numTheta))
  args <- list(
    type = "polr",
    coefficients = mod$beta,
    method=method,
    vcov = as.matrix(vcov(mod)[or, or]))
  Effect.default(focal.predictors, mod, ..., sources=args)
}

## ----fig.height=6,fig.width=6---------------------------------------------
require(ordinal)
require(MASS)
mod.wvs1 <- clm(poverty ~ gender + religion + degree + country*poly(age,3),
    data=WVS)
plot(Effect(c("country", "age"), mod.wvs1), 
     lines=list(multiline=TRUE), layout=c(2, 2))

## ----eval=FALSE-----------------------------------------------------------
#  Effect.clm2 <- function(focal.predictors, mod, ...){
#    if (requireNamespace("MASS", quietly=TRUE)){
#        polr <- MASS::polr}
#    polr.methods <- c("logistic", "probit", "loglog",
#                      "cloglog", "cauchit")
#    method <- mod$link
#    if(!(method %in% polr.methods))
#      stop("'link' must be a 'method' supported by polr; see help(polr)")
#    if(is.null(mod$Hessian)){
#       message("\nRe-fitting to get Hessian\n")
#       mod <- update(mod, Hess=TRUE)}
#    if(mod$threshold != "flexible")
#      stop("Effects only supports the flexible threshold")
#    numTheta <- length(mod$Theta)
#    numBeta <- length(mod$beta)
#    or <- c( (numTheta+1):(numTheta + numBeta), 1:(numTheta))
#    args <- list(
#      type = "polr",
#      formula = mod$call$location,
#      coefficients = mod$beta,
#      method=method,
#      vcov = as.matrix(vcov(mod)[or, or]))
#    Effect.default(focal.predictors, mod, ..., sources=args)
#  }

## ----fig.height=6,fig.width=8---------------------------------------------
require(ordinal)
require(MASS)
v2 <- clm2(poverty ~ gender + religion + degree + country*poly(age,3),data=WVS)
plot(emod2 <- Effect(c("country", "age"), v2))

## ----eval=FALSE-----------------------------------------------------------
#  Effect.clmm <- function(focal.predictors, mod, ...){
#    if (requireNamespace("MASS", quietly=TRUE)){
#      polr <- MASS::polr}
#    else stop("The MASS package must be installed")
#    polr.methods <- c("logistic", "probit", "loglog",
#                      "cloglog", "cauchit")
#    method <- mod$link
#    if(method == "logit") method <- "logistic"
#    if(!(method %in% polr.methods))
#      stop("'link' must be a 'method' supported by polr; see help(polr)")
#    if(is.null(mod$Hessian)){
#      message("\nRe-fitting to get Hessian\n")
#      mod <- update(mod, Hess=TRUE)}
#    if(mod$threshold != "flexible")
#      stop("Only threshold='flexible supported by Effects")
#    numTheta <- length(mod$Theta)
#    numBeta <- length(mod$beta)
#    or <- c( (numTheta+1):(numTheta + numBeta), 1:(numTheta))
#    Vcov <- as.matrix(vcov(mod)[or, or])
#    args <- list(
#      type = "polr",
#      formula = formula(mod),
#      coefficients = mod$beta,
#      method=method,
#      vcov = as.matrix(Vcov))
#    Effect.default(focal.predictors, mod, ..., sources=args)
#  }

## ----fig.height=4,fig.width=4,cache=FALSE---------------------------------
require(ordinal)
require(MASS)
mm1 <- clmm(SURENESS ~ PROD + (1|RESP) + (1|RESP:PROD), 
        data = soup, link = "logit", threshold = "flexible")
plot(Effect("PROD", mm1),lines=list(multiline=TRUE))

## ----fig.height=6,fig.width=6---------------------------------------------
data(Baumann, package="carData")
b1 <- lm(cbind(post.test.1, post.test.2, post.test.3) ~ group + 
    pretest.1 + pretest.2, data = Baumann)
plot(Effect("group", b1))

