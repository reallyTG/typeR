library(flatr)


### Name: goodness_of_fit
### Title: Calculate the Chi^2 and G^2 Statistics
### Aliases: goodness_of_fit

### ** Examples

lung_logit <-
  lung_cancer %>%
  flatten_ct() %>%
  glm(
    Lung ~ Smoking
    ,family = binomial
    ,data = .
  )

goodness_of_fit(model = lung_logit, type = "Chisq")
lung_logit %>%
  goodness_of_fit(type = "Gsq")
lung_cancer %>%
  flatten_ct() %>%
  glm(
    Lung ~ City + Smoking
    ,family = binomial
    ,data = .
  ) %>%
  goodness_of_fit()




