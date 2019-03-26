library(glmx)


### Name: AbortionAmbivalence
### Title: American Ambivalence towards Abortion Policy
### Aliases: AbortionAmbivalence
### Keywords: datasets

### ** Examples

data("AbortionAmbivalence")

## first model for mother's health
ab_health <- hetglm(
  health ~ ethnicity + gender + religion + religiousness + church + erameans + erasupport |
  pros * cons + importance + information + firmness, data = AbortionAmbivalence)
summary(ab_health)

## corresponding model with analytical gradients but numerical Hessian
ab_health2 <- update(ab_health, method = "BFGS", hessian = TRUE)
summary(ab_health2)

## Alvarez and Brehm (1995), Table 1, p. 1069
## (see also Altman and McDonald, 2003, Supplement, Tables 4-10)
tab1 <- sapply(names(AbortionAmbivalence)[1:7], function(x) {
  f <- as.formula(paste(x,
    "~ ethnicity + gender + religion + religiousness + church + erameans + erasupport",
    "| pros * cons + importance + information + firmness"))
  f0 <- as.formula(paste(x, "~ 1"))
  m <- hetglm(f, data = AbortionAmbivalence)
  m0 <- hetglm(f0, data = model.frame(m))
  c(Percent_yes = as.vector(100 * prop.table(table(AbortionAmbivalence[[x]]))["yes"]),
    coef(m)[c(1:10, 14, 11:13)],
    Heteroskedasticity = as.vector(summary(m)$lrtest[1]),
    N = nobs(m),
    Goodness_of_fit = 2 * as.vector(logLik(m) - logLik(m0))
  )
})
round(tab1, digits = 2)


if(require("AER")) {
## compare Wald tests with different types of standard errors
coeftest(ab_health)
coeftest(ab_health2)
coeftest(ab_health,  vcov = sandwich)
coeftest(ab_health2, vcov = sandwich)
coeftest(ab_health,  vcov = vcovOPG)
coeftest(ab_health2, vcov = vcovOPG)

ab_health_tstat <- cbind(
  "A-Info"     = coeftest(ab_health)[,3],
  "N-Info"     = coeftest(ab_health2)[,3],
  "A-Sandwich" = coeftest(ab_health,  vcov = sandwich)[,3],
  "N-Sandwich" = coeftest(ab_health2, vcov = sandwich)[,3],
  "A-OPG"      = coeftest(ab_health,  vcov = vcovOPG)[,3],
  "N-OPG"      = coeftest(ab_health2, vcov = vcovOPG)[,3]
)
round(ab_health_tstat, digits = 3)
}



