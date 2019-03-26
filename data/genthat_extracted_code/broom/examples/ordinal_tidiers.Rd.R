library(broom)


### Name: tidy.polr
### Title: Tidying methods for ordinal logistic regression models
### Aliases: tidy.polr glance.polr augment.polr ordinal_tidiers tidy.clm
###   tidy.clmm glance.clm glance.clmm augment.clm tidy.svyolr
###   glance.svyolr

### ** Examples

if (require(ordinal)){
  clm_mod <- clm(rating ~ temp * contact, data = wine)
  tidy(clm_mod)
  tidy(clm_mod, conf.int = TRUE)
  tidy(clm_mod, conf.int = TRUE, conf.type = "Wald", exponentiate = TRUE)
  glance(clm_mod)
  augment(clm_mod)

  clm_mod2 <- clm(rating ~ temp, nominal = ~ contact, data = wine)
  tidy(clm_mod2)

  clmm_mod <- clmm(rating ~ temp + contact + (1 | judge), data = wine)
  tidy(clmm_mod)
  glance(clmm_mod)
}
if (require(MASS)) {
  polr_mod <- polr(Sat ~ Infl + Type + Cont, weights = Freq, data = housing)
  tidy(polr_mod, exponentiate = TRUE, conf.int = TRUE)
  glance(polr_mod)
  augment(polr_mod, type.predict = "class")
}



