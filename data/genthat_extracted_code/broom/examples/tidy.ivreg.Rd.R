library(broom)


### Name: tidy.ivreg
### Title: Tidy a(n) ivreg object
### Aliases: tidy.ivreg ivreg_tidiers aer_tidiers

### ** Examples


library(AER)

data("CigarettesSW", package = "AER")
ivr <- ivreg(
  log(packs) ~ income | population,
  data = CigarettesSW,
  subset = year == "1995"
)

summary(ivr)

tidy(ivr)
tidy(ivr, conf.int = TRUE)
tidy(ivr, conf.int = TRUE, exponentiate = TRUE)

augment(ivr)

glance(ivr)




