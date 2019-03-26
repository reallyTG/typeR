## ----echo = FALSE--------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", warning = FALSE, message = FALSE)

## ------------------------------------------------------------------------
# load package
library(sjPlot)
library(sjmisc)
library(sjlabelled)

# sample data
data("efc")
efc <- as_factor(efc, c161sex, c172code)

## ---- results='hide'-----------------------------------------------------
m1 <- lm(barthtot ~ c160age + c12hour + c161sex + c172code, data = efc)
m2 <- lm(neg_c_7 ~ c160age + c12hour + c161sex + e17age, data = efc)

## ------------------------------------------------------------------------
tab_model(m1)

## ------------------------------------------------------------------------
data(mtcars)
m.mtcars <- lm(mpg ~ cyl + hp + wt, data = mtcars)
tab_model(m.mtcars)

## ------------------------------------------------------------------------
tab_model(m1, auto.label = FALSE)

## ------------------------------------------------------------------------
tab_model(m1, m2)

## ------------------------------------------------------------------------
m3 <- glm(
  tot_sc_e ~ c160age + c12hour + c161sex + c172code, 
  data = efc,
  family = poisson(link = "log")
)

efc$neg_c_7d <- ifelse(efc$neg_c_7 < median(efc$neg_c_7, na.rm = TRUE), 0, 1)
m4 <- glm(
  neg_c_7d ~ c161sex + barthtot + c172code,
  data = efc,
  family = binomial(link = "logit")
)

tab_model(m3, m4)

## ------------------------------------------------------------------------
tab_model(m3, m4, transform = NULL, auto.label = FALSE)

## ------------------------------------------------------------------------
library(pscl)
data("bioChemists")

m5 <- zeroinfl(art ~ . | ., data = bioChemists)
tab_model(m5)

## ------------------------------------------------------------------------
tab_model(m1, m3, m5, auto.label = FALSE, show.ci = FALSE)

## ------------------------------------------------------------------------
tab_model(m1, show.se = TRUE, show.std = TRUE, show.stat = TRUE)

## ------------------------------------------------------------------------
tab_model(m3, m4, show.ci = FALSE, show.p = FALSE, auto.label = FALSE)

## ------------------------------------------------------------------------
tab_model(
  m1, show.se = TRUE, show.std = TRUE, show.stat = TRUE,
  col.order = c("p", "stat", "est", "std.se", "se", "std.est")
)

## ------------------------------------------------------------------------
tab_model(m1, collapse.ci = TRUE)

## ------------------------------------------------------------------------
tab_model(
  m1, m2, 
  pred.labels = c("Intercept", "Age (Carer)", "Hours per Week", "Gender (Carer)",
                  "Education: middle (Carer)", "Education: high (Carer)", 
                  "Age (Older Person)"),
  dv.labels = c("First Model", "M2"),
  string.pred = "Coeffcient",
  string.ci = "Conf. Int (95%)",
  string.p = "P-Value"
)

## ------------------------------------------------------------------------
tab_model(m1, m2, p.style = "a")

## ------------------------------------------------------------------------
# example, coefficients are "c161sex2" or "c172code3"
summary(m1)

pl <- c(
  `(Intercept)` = "Intercept",
  e17age = "Age (Older Person)",
  c160age = "Age (Carer)", 
  c12hour = "Hours per Week", 
  barthtot = "Barthel-Index",
  c161sex2 = "Gender (Carer)",
  c172code2 = "Education: middle (Carer)", 
  c172code3 = "Education: high (Carer)",
  a_non_used_label = "We don't care"
)
 
tab_model(
  m1, m2, m3, m4, 
  pred.labels = pl, 
  dv.labels = c("Model1", "Model2", "Model3", "Model4"),
  show.ci = FALSE, 
  show.p = FALSE, 
  transform = NULL
)

## ------------------------------------------------------------------------
tab_model(m1, terms = c("c160age", "c12hour"))

## ------------------------------------------------------------------------
tab_model(m1, rm.terms = c("c172code2", "c161sex2"))

