## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, warnings = FALSE, messages = FALSE)

## ------------------------------------------------------------------------
data("lalonde", package = "cobalt")
head(lalonde)

## ------------------------------------------------------------------------
library("cobalt")
bal.tab(treat ~ age + educ + race + married + nodegree + re74 + re75,
        data = lalonde, estimand = "ATT", m.threshold = .1)

## ------------------------------------------------------------------------
library("WeightIt")
W.out <- weightit(treat ~ age + educ + race + married + nodegree + re74 + re75,
        data = lalonde, estimand = "ATT", method = "ps")
W.out #print the ooutput

## ------------------------------------------------------------------------
summary(W.out)

## ------------------------------------------------------------------------
bal.tab(W.out, m.threshold = .1, disp.v.ratio = TRUE)

## ------------------------------------------------------------------------
W.out <- weightit(treat ~ age + educ + race + married + nodegree + re74 + re75,
        data = lalonde, estimand = "ATT", method = "ebal")
summary(W.out)

## ------------------------------------------------------------------------
bal.tab(W.out, m.threshold = .1, disp.v.ratio = TRUE)

## ---- message=FALSE------------------------------------------------------
library("survey")
d.w <- svydesign(ids = ~1, weights = get.w(W.out),
                     data = lalonde)
fit <- svyglm(re78 ~ treat, design = d.w)
coef(fit)

## ------------------------------------------------------------------------
#Robust standard errors and confidence intervals
library("jtools")
summ(fit, confint = TRUE) 

## ---- warning=FALSE, message=FALSE---------------------------------------
#Bootstrapping
library("boot")
est.fun <- function(data, index) {
  W.out <- weightit(treat ~ age + educ + race + married + nodegree + re74 + re75,
        data = data[index,], estimand = "ATT", method = "ebal")
  fit <- glm(re78 ~ treat, data = data[index,], weights = get.w(W.out))
  return(coef(fit)["treat"])
}
boot.out <- boot(est.fun, data = lalonde, R = 999)
boot.ci(boot.out, type = "bca") #type shouldn't matter so much

## ------------------------------------------------------------------------
data("iptwExWide", package = "twang")
head(iptwExWide)

## ------------------------------------------------------------------------
library("cobalt") #if not already attached
bal.tab(list(tx1 ~ age + gender + use0,
             tx2 ~ tx1 + use1 + age + gender + use0,
             tx3 ~ tx2 + use2 + tx1 + use1 + age + gender + use0),
        data = iptwExWide, m.threshold = .1)

## ------------------------------------------------------------------------
Wmsm.out <- weightitMSM(list(tx1 ~ age + gender + use0,
             tx2 ~ tx1 + use1 + age + gender + use0,
             tx3 ~ tx2 + use2 + tx1 + use1 + age + gender + use0),
        data = iptwExWide, method = "ps")
Wmsm.out

## ------------------------------------------------------------------------
summary(Wmsm.out)

## ------------------------------------------------------------------------
bal.tab(Wmsm.out, m.threshold = .1, disp.v.ratio = TRUE, which.time = NA)

## ---- message=FALSE------------------------------------------------------
library("survey")
d.w.msm <- svydesign(ids = ~1, weights = get.w(Wmsm.out),
                     data = iptwExWide)
full.fit <- svyglm(outcome ~ tx1*tx2*tx3, design = d.w.msm)
main.effects.fit <- svyglm(outcome ~ tx1 + tx2 + tx3, design = d.w.msm)
anova(full.fit, main.effects.fit)

## ------------------------------------------------------------------------
cum.fit <- svyglm(outcome ~ I(tx1+tx2+tx3), design = d.w.msm)
anova(main.effects.fit, cum.fit)

## ------------------------------------------------------------------------
summ(cum.fit, confint = TRUE) 

