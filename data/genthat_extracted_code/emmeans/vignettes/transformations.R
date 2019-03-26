## ---- echo = FALSE, results = "hide", message = FALSE--------------------
require("emmeans")
knitr::opts_chunk$set(fig.width = 4.5, class.output = "ro")

## ------------------------------------------------------------------------
pigs.lm <- lm(log(conc) ~ source + factor(percent), data = pigs)

## ------------------------------------------------------------------------
pigs.emm.s <- emmeans(pigs.lm, "source")
str(pigs.emm.s)

## ------------------------------------------------------------------------
summary(pigs.emm.s, infer = TRUE, null = log(35))

## ------------------------------------------------------------------------
summary(pigs.emm.s, infer = TRUE, null = log(35), type = "response")

## ------------------------------------------------------------------------
str(regrid(pigs.emm.s))

summary(regrid(pigs.emm.s), infer = TRUE, null = 35)

## ------------------------------------------------------------------------
pigs.rg <- ref_grid(pigs.lm)
pigs.remm.s <- emmeans(regrid(pigs.rg), "source")
summary(pigs.remm.s, infer = TRUE, null = 35)

## ----eval = FALSE--------------------------------------------------------
#  pigs.remm.s <- emmeans(pigs.lm, "source", transform = "response")

## ----eval = FALSE--------------------------------------------------------
#  emmeans(pigs.lm, "source", type = "response")

## ------------------------------------------------------------------------
neuralgia.glm <- glm(Pain ~ Treatment * Sex + Age, family = binomial(), data = neuralgia)
neuralgia.emm <- emmeans(neuralgia.glm, "Treatment", type = "response")
neuralgia.emm

## ------------------------------------------------------------------------
pairs(neuralgia.emm, reverse = TRUE)

## ------------------------------------------------------------------------
emmip(neuralgia.glm, Sex ~ Treatment)

## ------------------------------------------------------------------------
warp.glm <- glm(sqrt(breaks) ~ wool*tension, family = Gamma, data = warpbreaks)
ref_grid(warp.glm)

## ------------------------------------------------------------------------
emmeans(warp.glm, ~ tension | wool, type = "response")

## ------------------------------------------------------------------------
emmeans(warp.glm, ~ tension | wool, type = "unlink")

## ----eval = FALSE--------------------------------------------------------
#  tran <- make.tran("genlog", 1/2)
#  my.model <- with(tran,
#      lmer(linkfun(yield) ~ treatment + (1|Block), data = mydata))

## ----eval = FALSE--------------------------------------------------------
#  mydata <- transform(mydata, logy.5 = log(yield + .5))
#  my.model <- lmer(logy.5 ~ treatment + (1|Block), data = mydata)

## ----eval = FALSE--------------------------------------------------------
#  my.rg <- update(ref_grid(my.model), tran = make.tran("genlog", .5))

## ----eval = FALSE--------------------------------------------------------
#  model.rg <- update(ref_grid(model), tran = "sqrt")

## ------------------------------------------------------------------------
pigroot.lm <- lm(sqrt(conc) ~ source + factor(percent), data = pigs)
piglog.emm.s <- regrid(emmeans(pigroot.lm, "source"), transform = "log")
confint(piglog.emm.s, type = "response")
pairs(piglog.emm.s, type = "response")

