library(broom)


### Name: tidy.poLCA
### Title: Tidy a(n) poLCA object
### Aliases: tidy.poLCA poLCA_tidiers

### ** Examples


if (require("poLCA", quietly = TRUE)) {
  library(poLCA)
  library(dplyr)

  data(values)
  f <- cbind(A, B, C, D)~1
  M1 <- poLCA(f, values, nclass = 2, verbose = FALSE)

  M1
  tidy(M1)
  augment(M1)
  glance(M1)

  library(ggplot2)

  ggplot(tidy(M1), aes(factor(class), estimate, fill = factor(outcome))) +
    geom_bar(stat = "identity", width = 1) +
    facet_wrap(~ variable)

  set.seed(2016)
  # compare multiple
  mods <- tibble(nclass = 1:3) %>%
    group_by(nclass) %>%
    do(mod = poLCA(f, values, nclass = .$nclass, verbose = FALSE))

  # compare log-likelihood and/or AIC, BIC
  mods %>%
    glance(mod)

  ## Three-class model with a single covariate.

  data(election)
  f2a <- cbind(MORALG,CARESG,KNOWG,LEADG,DISHONG,INTELG,
               MORALB,CARESB,KNOWB,LEADB,DISHONB,INTELB)~PARTY
  nes2a <- poLCA(f2a, election, nclass = 3, nrep = 5, verbose = FALSE)

  td <- tidy(nes2a)
  td

  # show

  ggplot(td, aes(outcome, estimate, color = factor(class), group = class)) +
    geom_line() +
    facet_wrap(~ variable, nrow = 2) +
    theme(axis.text.x = element_text(angle = 90, hjust = 1))

  au <- augment(nes2a)
  au
  au %>%
    count(.class)

  # if the original data is provided, it leads to NAs in new columns
  # for rows that weren't predicted
  au2 <- augment(nes2a, data = election)
  au2
  dim(au2)
}




