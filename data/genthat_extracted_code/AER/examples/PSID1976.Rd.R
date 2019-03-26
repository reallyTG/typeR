library(AER)


### Name: PSID1976
### Title: Labor Force Participation Data
### Aliases: PSID1976
### Keywords: datasets

### ** Examples

## data and transformations
data("PSID1976")
PSID1976$kids <- with(PSID1976, factor((youngkids + oldkids) > 0,
  levels = c(FALSE, TRUE), labels = c("no", "yes")))
PSID1976$nwincome <- with(PSID1976, (fincome - hours * wage)/1000)
PSID1976$partnum <- as.numeric(PSID1976$participation) - 1

###################
## Greene (2003) ##
###################

## Example 4.1, Table 4.2
## (reproduced in Example 7.1, Table 7.1)
gr_lm <- lm(log(hours * wage) ~ age + I(age^2) + education + kids,
  data = PSID1976, subset = participation == "yes")
summary(gr_lm)
vcov(gr_lm)

## Example 4.5
summary(gr_lm)
## or equivalently
gr_lm1 <- lm(log(hours * wage) ~ 1, data = PSID1976, subset = participation == "yes")
anova(gr_lm1, gr_lm)

## Example 21.4, p. 681, and Tab. 21.3, p. 682
gr_probit1 <- glm(participation ~ age + I(age^2) + I(fincome/10000) + education + kids,
  data = PSID1976, family = binomial(link = "probit") )  
gr_probit2 <- glm(participation ~ age + I(age^2) + I(fincome/10000) + education,
  data = PSID1976, family = binomial(link = "probit"))
gr_probit3 <- glm(participation ~ kids/(age + I(age^2) + I(fincome/10000) + education),
  data = PSID1976, family = binomial(link = "probit"))
## LR test of all coefficients
lrtest(gr_probit1)
## Chow-type test
lrtest(gr_probit2, gr_probit3)
## equivalently:
anova(gr_probit2, gr_probit3, test = "Chisq")
## Table 21.3
summary(gr_probit1)

## Example 22.8, Table 22.7, p. 786
library("sampleSelection")
gr_2step <- selection(participation ~ age + I(age^2) + fincome + education + kids, 
  wage ~ experience + I(experience^2) + education + city,
  data = PSID1976, method = "2step")
gr_ml <- selection(participation ~ age + I(age^2) + fincome + education + kids, 
  wage ~ experience + I(experience^2) + education + city,
  data = PSID1976, method = "ml")
gr_ols <- lm(wage ~ experience + I(experience^2) + education + city,
  data = PSID1976, subset = participation == "yes")
## NOTE: ML estimates agree with Greene, 5e errata. 
## Standard errors are based on the Hessian (here), while Greene has BHHH/OPG. 


#######################
## Wooldridge (2002) ##
#######################

## Table 15.1, p. 468
wl_lpm <- lm(partnum ~ nwincome + education + experience + I(experience^2) +
  age + youngkids + oldkids, data = PSID1976)
wl_logit <- glm(participation ~ nwincome + education + experience + I(experience^2) +
  age + youngkids + oldkids, family = binomial, data = PSID1976)
wl_probit <- glm(participation ~ nwincome + education + experience + I(experience^2) +
  age + youngkids + oldkids, family = binomial(link = "probit"), data = PSID1976)
## (same as Altman et al.)

## convenience functions
pseudoR2 <- function(obj) 1 - as.vector(logLik(obj)/logLik(update(obj, . ~ 1)))
misclass <- function(obj) 1 - sum(diag(prop.table(table(
  model.response(model.frame(obj)), round(fitted(obj))))))

coeftest(wl_logit)
logLik(wl_logit)
misclass(wl_logit)
pseudoR2(wl_logit)

coeftest(wl_probit)
logLik(wl_probit)
misclass(wl_probit)
pseudoR2(wl_probit)

## Table 16.2, p. 528
form <- hours ~ nwincome + education + experience + I(experience^2) + age + youngkids + oldkids 
wl_ols <- lm(form, data = PSID1976)
wl_tobit <- tobit(form, data = PSID1976)
summary(wl_ols)
summary(wl_tobit)


#######################
## McCullough (2004) ##
#######################

## p. 203
mc_probit <- glm(participation ~ nwincome + education + experience + I(experience^2) +
  age + youngkids + oldkids, family = binomial(link = "probit"), data = PSID1976)
mc_tobit <- tobit(hours ~ nwincome + education + experience + I(experience^2) + age +
  youngkids + oldkids, data = PSID1976)
coeftest(mc_probit)
coeftest(mc_tobit)
coeftest(mc_tobit, vcov = vcovOPG)



