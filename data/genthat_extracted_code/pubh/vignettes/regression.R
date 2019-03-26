## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", message = FALSE, warning = FALSE)

## ---- message=FALSE------------------------------------------------------
rm(list = ls())
library(effects, warn.conflicts = FALSE)
library(latex2exp, warn.conflicts = FALSE)
library(multcomp, warn.conflicts = FALSE)
library(pander, warn.conflicts = FALSE)
library(papeR, warn.conflicts = FALSE)
library(pubh, warn.conflicts = FALSE)

panderOptions("table.split.table", Inf)
set.alignment("right", row.names = "left", permanent = TRUE)
trellis.par.set(tactile.theme())

## ---- message=FALSE------------------------------------------------------
data(birthwt)
birthwt$smoke <- factor(birthwt$smoke, labels=c("Non-smoker", "Smoker"))
birthwt$race <- factor(birthwt$race > 1, labels=c("White", "Non-white"))
model_norm <- glm(bwt ~ smoke + race, data = birthwt)

## ------------------------------------------------------------------------
Anova(model_norm)

## ------------------------------------------------------------------------
summary(model_norm)

## ------------------------------------------------------------------------
glm_coef(model_norm)

## ------------------------------------------------------------------------
pander(glm_coef(model_norm, labels = c("Constant", "Smoker - Non-smoker", 
                                      "Non-white - White"), se.rob = FALSE),
      caption = "Table of coeffients using naive standard errors.")

## ------------------------------------------------------------------------
pander(glm_coef(model_norm, labels = c("Constant", "Smoker - Non-smoker", 
                                      "Non-white - White")),
       caption = "Table of coeffients using robust standard errors.")

## ------------------------------------------------------------------------
plot(Effect(c("smoke", "race"), model_norm), multiline = TRUE, main = NULL, 
     ylab = "Birth weight (g)", xlab = "Smoking status", symbols = list(pch = 16),
     confint = list(style = "auto"), aspect = 3/4, lines = list(lwd = 1.5))

## ------------------------------------------------------------------------
data(diet, package = "Epi")
model_binom <- glm(chd ~ fibre, data = diet, family = binomial)

## ------------------------------------------------------------------------
pander(glm_coef(model_binom, labels = c("Constant", "Fibre intake (g/day)")), 
      caption = "Parameter estimates from logistic regression.")

## ------------------------------------------------------------------------
plot(Effect("fibre", model_binom), type = "response", rug = FALSE, aspect = 3/4,
       ylab = "P (CHD)", xlab = "Fibre (g/day)", lwd = 2, 
     confint = list(style = "none"), main = NULL)

## ------------------------------------------------------------------------
data(bdendo, package = "Epi")
levels(bdendo$gall) <- c("No GBD", "GBD")
levels(bdendo$est) <- c("No oestrogen", "Oestrogen")

## ------------------------------------------------------------------------
model_clogit <- clogit(d ~ est * gall + strata(set), data = bdendo)
glm_coef(model_clogit)

## ------------------------------------------------------------------------
pander(glm_coef(model_clogit, labels = c("Oestrogen/No oestrogen", "GBD/No GBD", 
                                         "Oestrogen:GBD Interaction")), 
       caption = "Parameter estimates from conditional logistic regression.")

## ------------------------------------------------------------------------
bdendo_grid <- with(bdendo, expand.grid(
  gall = levels(gall),
  est = levels(est),
  set = sample(1:63, 1)
))

## ------------------------------------------------------------------------
bdendo_pred <- predict(model_clogit, bdendo_grid, type = "lp", se.fit = TRUE)
bdendo_grid$fit <- inv_logit(bdendo_pred$fit)
bdendo_grid$se <- inv_logit(bdendo_pred$se)
bdendo_grid$lo <- inv_logit(bdendo_pred$fit - 1.96 * bdendo_pred$se)
bdendo_grid$up <- inv_logit(bdendo_pred$fit + 1.96 * bdendo_pred$se)

## ------------------------------------------------------------------------
xyplot(cbind(fit, lo, up) ~ gall|est, data = bdendo_grid,  pch = 20, 
       panel = panel.errbars, xlab = "Gall blader disease", ylab = "P (cancer)")

## ------------------------------------------------------------------------
library(ordinal, warn.conflicts = FALSE)
data(housing)
model_clm <- clm(Sat ~ Infl + Type + Cont, weights = Freq, data = housing)
glm_coef(model_clm)

## ------------------------------------------------------------------------
labs_ord <- c("Constant: Low/Medium satisfaction",
              "Constant: Medium/High satisfaction",
              "Perceived influence: Medium/Low",
              "Perceived influence: High/Low",
              "Accommodation: Apartment/Tower",
              "Accommodation: Atrium/Tower",
              "Accommodation: Terrace/Tower",
              "Afforded: High/Low")
pander(glm_coef(model_clm, labels = labs_ord), 
      caption = "Parameter estimates on satisfaction of householders.")

## ------------------------------------------------------------------------
plot(Effect(c("Infl", "Type", "Cont"), model_clm), main = NULL, aspect = 3/4, rotx = 45, 
     ylab = "Satisfaction (probability)", lines = list(lwd = 1.5, multiline = TRUE),
     confint = list(style="none"), symbols = list(pch = rep(20, 3)),
     ylim = c(0, 1))

## ---- message=FALSE------------------------------------------------------
library(nnet)
model_multi <- multinom(Sat ~ Infl + Type + Cont, weights = Freq, data = housing)

## ------------------------------------------------------------------------
glm_coef(model_multi)

## ------------------------------------------------------------------------
plot(Effect(c("Infl", "Type", "Cont"), model_multi), main = NULL, aspect = 3/4, rotx = 45, 
     ylab = "Satisfaction (probability)", lines = list(lwd = 1.5, multiline = TRUE),
     confint = list(style = "none"), symbols = list(pch = rep(20, 3)),
     ylim = c(0, 1))

## ------------------------------------------------------------------------
data(quine)
levels(quine$Eth) <- list(White = "N", Aboriginal = "A")
levels(quine$Sex) <- list(Male = "M", Female = "F")
model_pois <- glm(Days ~ Eth + Sex + Age, family = poisson, data = quine)
glm_coef(model_pois)

## ------------------------------------------------------------------------
pander(estat(~ Days|Eth, data = quine, label = "Days of school absences"))

## ------------------------------------------------------------------------
deviance(model_pois) / df.residual(model_pois)

## ------------------------------------------------------------------------
model_negbin <- glm.nb(Days ~ Eth + Sex + Age, data = quine)
unadj <- glm_coef(model_negbin, labels=c("Constant",
                                   "Race: Aboriginal/White",
                                   "Sex: Female/Male",
                                   "F1/Primary",
                                   "F2/Primary",
                                   "F3/Primary"))

## ------------------------------------------------------------------------
Anova(model_negbin)

## ------------------------------------------------------------------------
pander(unadj, caption = "Parameter estimates with unadjusted CIs and p-values.",
      align = c("r", "r"))

## ------------------------------------------------------------------------
plot(Effect(c("Age", "Eth"), model_negbin), lines = list(lwd = 1.5, multiline = TRUE),
     confint = list(style = "none"), symbols = list(pch = rep(20, 2)), main = NULL, 
     aspect = 3/4)

## ---- message=FALSE------------------------------------------------------
model_glht <- glht(model_negbin, linfct  = mcp(Age = "Tukey"))
age_glht <- xymultiple(model_glht, Exp = TRUE, plot = FALSE)

## ---- fig.cap="Parameter estimates on the effect of age group on the number of days absent from school. Bars represent 95% CIs adjusted by the method of Bonferroni for multiple comparisons."----
xymultiple(model_glht, Exp = TRUE)

## ------------------------------------------------------------------------
final <- unadj

final[, 1] <- as.character(final[, 1])
final[4:6, 1] <- paste0(age_glht[1:3, 2], " (", age_glht[1:3, 3],
                        ", ", age_glht[1:3, 4], ")")

final[, 2] <- as.character(final[, 2])
final[4:6, 2] <- as.character(age_glht[1:3, 5])

## ------------------------------------------------------------------------
pander(final, caption = "Parameter estimates. CIs and
       p-values for age group were adjusted for multiple comparisons by the 
       method of Bonferroni")

## ------------------------------------------------------------------------
data(bladder)
bladder$times <- bladder$stop
bladder$rx <- factor(bladder$rx, labels=c("Placebo", "Thiotepa"))

## ------------------------------------------------------------------------
model_surv <- survreg(Surv(times, event) ~ rx, data = bladder)

## ------------------------------------------------------------------------
glm_coef(model_surv)

## ------------------------------------------------------------------------
pander(glm_coef(model_surv, labels = c("Treatment: Thiotepa/Placebo", "Scale")))

## ------------------------------------------------------------------------
model_exp <- survreg(Surv(times, event) ~ rx, data = bladder, dist = "exponential")
pander(glm_coef(model_exp, labels = "Treatment: Thiotepa/Placebo"))

## ------------------------------------------------------------------------
pander(glm_coef(model_exp, se.rob = FALSE, labels = "Treatment: Thiotepa/Placebo"))

## ------------------------------------------------------------------------
bladder_grid <- with(bladder, expand.grid(
  rx = levels(rx)
))

## ------------------------------------------------------------------------
bladder_pred <- predict(model_exp, bladder_grid, se.fit = TRUE, type = "response")
bladder_grid$fit <- bladder_pred$fit
bladder_grid$se <- bladder_pred$se
bladder_grid$lo <- bladder_pred$fit - 1.96 * bladder_pred$se
bladder_grid$up <- bladder_pred$fit + 1.96 * bladder_pred$se

## ------------------------------------------------------------------------
xyplot(cbind(fit, lo, up) ~ rx, data = bladder_grid, pch = 20, panel = panel.errbars,
       ylab = "Survival time", xlab = "Treatment", aspect = 3/4)

## ------------------------------------------------------------------------
model_cox <-  coxph(Surv(times, event) ~ rx, data = bladder)

## ------------------------------------------------------------------------
pander(glm_coef(model_cox, labels = c("Treatment: Thiotepa/Placebo")))

## ------------------------------------------------------------------------
cox_grid <- with(bladder, expand.grid(
  rx = levels(rx)
))

## ------------------------------------------------------------------------
cox_pred <- predict(model_cox, cox_grid, se.fit = TRUE, type = "risk")
cox_grid$fit <- cox_pred$fit
cox_grid$se <- cox_pred$se
cox_grid$lo <- cox_pred$fit - 1.96 * cox_pred$se
cox_grid$up <- cox_pred$fit + 1.96 * cox_pred$se

## ------------------------------------------------------------------------
xyplot(cbind(fit, lo, up) ~ rx, data = cox_grid, pch = 20, panel = panel.errbars,
       ylab = "Hazard", xlab = "Treatment", aspect = 3/4)

## ------------------------------------------------------------------------
library(nlme, warn.conflicts = FALSE)
data(Orthodont)

## ------------------------------------------------------------------------
model_lme <- lme(distance ~ Sex * I(age - mean(age, na.rm = TRUE)), random = ~ 1|Subject, 
                 method = "ML", data = Orthodont)
glm_coef(model_lme)

## ------------------------------------------------------------------------
pander(glm_coef(model_lme, labels = c("Constant", "Sex: female-male", "Age (years)", 
                                      "Sex:Age interaction")))

## ------------------------------------------------------------------------
data(Thall)

c1 <- cbind(Thall[, c(1:5)], count = Thall$y1)[, c(1:4, 6)]
c2 <- cbind(Thall[, c(1:4, 6)], count = Thall$y2)[, c(1:4, 6)]
c3 <- cbind(Thall[, c(1:4, 7)], count = Thall$y3)[, c(1:4, 6)]
c4 <- cbind(Thall[, c(1:4, 8)], count = Thall$y3)[, c(1:4, 6)]
epilepsy <- rbind(c1, c2, c3, c4)

## ----results = "hide"----------------------------------------------------
library(lme4, warn.conflicts = FALSE)
model_glmer <- glmer(count ~ treat + base + I(age - mean(age, na.rm = TRUE)) + 
                       (1|id), data=epilepsy, family=poisson)

## ------------------------------------------------------------------------
pander(glm_coef(model_glmer, labels = c("Treatment (Prograbide/Control)", 
                               "Baseline count", "Age (years)")))

## ------------------------------------------------------------------------
plot(Effect(c("age", "treat"), model_glmer), rug = FALSE, lwd = 2, main = NULL,
     xlab = "Age (years)", ylab = "Events", aspect = 3/4, multiline = TRUE)

