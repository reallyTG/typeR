## ---- echo = FALSE, results = "hide", message = FALSE--------------------
require("emmeans") 
options(show.signif.stars = FALSE) 
knitr::opts_chunk$set(fig.width = 4.5, class.output = "ro") 

## ------------------------------------------------------------------------
Oats.lmer <- lme4::lmer(yield ~ Variety + factor(nitro) + (1|Block/Variety),
                        data = nlme::Oats, subset = -c(1,2,3,5,8,13,21,34,55))

## ------------------------------------------------------------------------
Oats.emm.n <- emmeans(Oats.lmer, "nitro")
Oats.emm.n

## ------------------------------------------------------------------------
emmeans(Oats.lmer, "nitro", lmer.df = "satterthwaite")

## ------------------------------------------------------------------------
emmeans(Oats.lmer, "nitro", lmer.df = "asymptotic")

## ------------------------------------------------------------------------
contrast(Oats.emm.n, "poly")

## ------------------------------------------------------------------------
emmeans(Oats.lmer, pairwise ~ Variety)

## ------------------------------------------------------------------------
ins <- data.frame(
    n = c(500, 1200, 100, 400, 500, 300),
    size = factor(rep(1:3,2), labels = c("S","M","L")),
    age = factor(rep(1:2, each = 3)),
    claims = c(42, 37, 1, 101, 73, 14))
ins.glm <- glm(claims ~ size + age + offset(log(n)), 
               data = ins, family = "poisson")

## ------------------------------------------------------------------------
ref_grid(ins.glm)

## ------------------------------------------------------------------------
emmeans(ins.glm, "size", type = "response")

## ------------------------------------------------------------------------
emmeans(ins.glm, "size", type = "response", offset = 0)

## ----eval = FALSE--------------------------------------------------------
#  emmeans(ins.glm, "size", type = "response", at = list(n = 1))

## ----eval = FALSE--------------------------------------------------------
#  emmeans(ins.glm, "size", type = "response", offset = log(100))

## ------------------------------------------------------------------------
require("ordinal")
wine.clm <- clm(rating ~ temp + contact, scale = ~ judge,
                data = wine, link = "probit")

## ------------------------------------------------------------------------
emmeans(wine.clm, list(pairwise ~ temp, pairwise ~ contact))

## ------------------------------------------------------------------------
tmp <- ref_grid(wine.clm, mode = "lin")
tmp

## ------------------------------------------------------------------------
emmeans(tmp, "temp")

## ------------------------------------------------------------------------
emmeans(wine.clm, ~ temp, mode = "exc.prob", at = list(cut = "3|4"))

## ------------------------------------------------------------------------
emmeans(wine.clm, ~ rating | temp, mode = "prob")

## ------------------------------------------------------------------------
emmeans(wine.clm, "temp", mode = "mean.class")

## ------------------------------------------------------------------------
summary(ref_grid(wine.clm, mode = "scale"), type = "response")

## ----eval = FALSE--------------------------------------------------------
#  example_model <- rstanarm::stan_glmer(
#      cbind(incidence, size - incidence) ~ size + period + (1|herd),
#      data = lme4::cbpp, family = binomial,
#      chains = 2, cores = 1, seed = 12345, iter = 500)
#  cbpp.rg <- ref_grid(example_model)

## ----echo = FALSE--------------------------------------------------------
cbpp.rg <- do.call(emmobj, 
    readRDS(system.file("extdata", "cbpplist", package = "emmeans")))

## ------------------------------------------------------------------------
cbpp.rg

## ------------------------------------------------------------------------
period.emm <- emmeans(cbpp.rg, "period")
period.emm

## ------------------------------------------------------------------------
require("coda")
summary(as.mcmc(period.emm))

## ------------------------------------------------------------------------
bayesplot::mcmc_areas(as.mcmc(regrid(period.emm)))

## ------------------------------------------------------------------------
contrast(period.emm, "consec", reverse = TRUE)

