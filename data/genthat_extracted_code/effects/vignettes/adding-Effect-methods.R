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
#    cl <- mod$call
#    cl$weights <- NULL
#    args <- list(
#      type = "glm",
#      call = cl,
#      formula = formula(mod),
#      family = NULL,
#      coefficients = coef(mod),
#      vcov = as.matrix(vcov(mod)),
#      method=NULL)
#    Effect.default(focal.predictors, mod, ..., sources=args)
#  }

## ----fig.height=4,fig.width=8---------------------------------------------
library(effects)
require(nlme)
g <- gls(Employed ~ GNP + Population,
         correlation=corAR1(form= ~ Year), data=longley)
plot(predictorEffects(g))

## -------------------------------------------------------------------------
print(Effect.lme)

## -------------------------------------------------------------------------
data(Orthodont, package="nlme")
m1 <- nlme::lme(distance ~ age + Sex, data=Orthodont, 
                random= ~ 1 | Subject)
as.data.frame(Effect("age", m1))

## -------------------------------------------------------------------------
print(Effect.merMod)

## ----fig.height=4,fig.width=8---------------------------------------------
fm2 <- lme4::lmer(distance ~ age + Sex + (1 |Subject), data
                  = Orthodont)
plot(allEffects(fm2))

## -------------------------------------------------------------------------
data(cbpp, package="lme4")
gm1 <- lme4::glmer(cbind(incidence, size - incidence) ~ period + (1 | herd),
              data = cbpp, family = binomial)
as.data.frame(predictorEffect("period", gm1))

## -------------------------------------------------------------------------
print(Effect.rlmerMod)

## ----eval=FALSE,fig.height=4, fig.width=8---------------------------------
#  require(lme4)
#  fm3 <- robustlmm::rlmer(distance ~ age * Sex + (1 |Subject),
#                          data = Orthodont)
#  plot(predictorEffects(fm3))

## -------------------------------------------------------------------------
print(Effect.betareg)

## ----echo=FALSE,results='hide', include=FALSE-----------------------------
require(lme4)

## ----fig.height=4,fig.width=8,cache=FALSE---------------------------------
require(betareg)
require(lme4)
data("GasolineYield", package = "betareg")
gy_logit <- betareg(yield ~ batch + temp, data = GasolineYield)
summary(gy_logit)
plot(predictorEffects(gy_logit))

## -------------------------------------------------------------------------
print(Effect.clm)

## ----echo=FALSE,results='hide', include=FALSE-----------------------------
require(ordinal)
require(MASS)

## ----fig.height=6,fig.width=6---------------------------------------------
require(ordinal)
require(MASS)
mod.wvs1 <- clm(poverty ~ gender + religion + degree + country*poly(age,3),
    data=WVS)
plot(Effect(c("country", "age"), mod.wvs1), 
     lines=list(multiline=TRUE), layout=c(2, 2))

## -------------------------------------------------------------------------
print(Effect.clm2)

## ----fig.height=6,fig.width=8---------------------------------------------
v2 <- clm2(poverty ~ gender + religion + degree + country*poly(age,3),data=WVS)
plot(emod2 <- Effect(c("country", "age"), v2), 
     lines=list(multiline=TRUE), layout=c(2,2))

## -------------------------------------------------------------------------
print(Effect.clmm)

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

