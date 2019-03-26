## ----pkgs,message=FALSE--------------------------------------------------
library(glmmTMB)
library(car)
library(emmeans)
library(effects)
library(multcomp)
library(MuMIn)
library(DHARMa)
## library(broom)
## library(broom.mixed)
library(dotwhisker)
library(ggplot2); theme_set(theme_bw())
## retrieve slow stuff
L <- load(system.file("vignette_data","model_evaluation.rda",package="glmmTMB"))

## ----fit_model,eval=FALSE------------------------------------------------
#  owls_nb1 <- glmmTMB(SiblingNegotiation ~ FoodTreatment*SexParent +
#                          (1|Nest)+offset(log(BroodSize)),
#                      contrasts=list(FoodTreatment="contr.sum",
#                                     SexParent="contr.sum"),
#                      family = nbinom1,
#                      zi = ~1, data=Owls)

## ----fit_model2,cache=TRUE-----------------------------------------------
data("cbpp",package="lme4")
cbpp_b1 <- glmmTMB(incidence/size~period+(1|herd),
                   weights=size,family=binomial,
                   data=cbpp)
## simulated three-term Beta example
set.seed(1001)
dd <- data.frame(z=rbeta(1000,shape1=2,shape2=3),
                 a=rnorm(1000),b=rnorm(1000),c=rnorm(1000))
simex_b1 <- glmmTMB(z~a*b*c,family=beta_family,data=dd)

## ----dharma_fake,eval=FALSE----------------------------------------------
#  owls_nb1_simres <- simulateResiduals(owls_nb1)

## ----dharma,cache=TRUE---------------------------------------------------
system.time(sr <- simulateResiduals(owls_nb1))

## ----dharmaplot,fig.width=8,fig.height=4---------------------------------
plot(sr)

## ----Anova---------------------------------------------------------------
Anova(owls_nb1)  ## default type II
Anova(owls_nb1,type="III")

## ----effects,fig.width=8,fig.height=4------------------------------------
(ae <- allEffects(owls_nb1))
plot(ae)
plot(allEffects(simex_b1))

## ----emmeans-------------------------------------------------------------
emmeans(owls_nb1, poly ~ FoodTreatment | SexParent)

## ----drop1,cache=TRUE----------------------------------------------------
system.time(owls_nb1_d1 <- drop1(owls_nb1,test="Chisq"))

## ----print_drop1---------------------------------------------------------
print(owls_nb1_d1)

## ----dredge1-------------------------------------------------------------
owls_nb1_dredge

## ----plot_dredge1,fig.width=8,fig.height=8-------------------------------
op <- par(mar=c(2,5,14,3))
plot(owls_nb1_dredge)
par(op) ## restore graphics parameters

## ----model_avg-----------------------------------------------------------
model.avg(owls_nb1_dredge)

## ----glht_def------------------------------------------------------------
glht_glmmTMB <- function (model, ..., component="cond") {
    glht(model, ...,
         coef. = function(x) fixef(x)[[component]],
         vcov. = function(x) vcov(x)[[component]],
         df = NULL)
}
modelparm.glmmTMB <- function (model, coef. = function(x) fixef(x)[[component]],
                               vcov. = function(x) vcov(x)[[component]],
                               df = NULL, component="cond", ...) {
    multcomp:::modelparm.default(model, coef. = coef., vcov. = vcov.,
                        df = df, ...)
}

## ----glht_ex-------------------------------------------------------------
g1 <- glht(cbpp_b1, linfct = mcp(period = "Tukey"))
summary(g1)

## ----dwplot,fig.width=8, eval=FALSE--------------------------------------
#  (t1 <- broom.mixed::tidy(owls_nb1, conf.int = TRUE))
#  if (packageVersion("dotwhisker")>"0.4.1") {
#      ## to get this version (which fixes various dotwhisker problems)
#      ## use devtools::install_github("bbolker/broom.mixed") or
#      ## wait for pull request acceptance/submission to CRAN/etc.
#      dwplot(owls_nb1)+geom_vline(xintercept=0,lty=2)
#  } else {
#      owls_nb1$coefficients <- TRUE  ## hack!
#      dwplot(owls_nb1,by_2sd=FALSE)+geom_vline(xintercept=0,lty=2)
#  }

## ----save_output,echo=FALSE,eval=FALSE-----------------------------------
#  ## store time-consuming stuff
#  save("owls_nb1",
#       "owls_nb1_simres",
#       "owls_nb1_dredge",
#       file="../inst/vignette_data/model_evaluation.rda")

