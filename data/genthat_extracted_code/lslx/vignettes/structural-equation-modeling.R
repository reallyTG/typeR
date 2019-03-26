## ----comment = "", message = FALSE, setup, include=FALSE------------------------------------------
options(digits = 3)
options(width = 100)

## ----comment = "", message = FALSE----------------------------------------------------------------
model_sem <- "fix(1) * x1 + x2 + x3      <=: ind60
              fix(1) * y1 + y2 + y3 + y4 <=: dem60
              fix(1) * y5 + y6 + y7 + y8 <=: dem65
              dem60 <= ind60
              dem65 <= ind60 + dem60"

## ----comment = "", message = FALSE----------------------------------------------------------------
library(lslx)
lslx_sem <- lslx$new(model = model_sem,
                    sample_cov = cov(lavaan::PoliticalDemocracy),
                    sample_size = nrow(lavaan::PoliticalDemocracy))

## ----comment = "", message = FALSE----------------------------------------------------------------
lslx_sem$penalize_coefficient(name = c("y1<->y5",
                                       "y2<->y4",
                                       "y2<->y6",
                                       "y3<->y7",
                                       "y4<->y8",
                                       "y6<->y8"))

## ----comment = "", message = FALSE----------------------------------------------------------------
lslx_sem$fit_lasso()

## ----comment = "", message = FALSE, fig.width = 24, fig.height = 14-------------------------------
lslx_sem$summarize(selector = "abic")

## ----comment = "", message = FALSE, fig.width = 8, fig.height = 4, dpi=300, out.width=600, out.height=300----
lslx_sem$extract_coefficient(selector = "abic", type = "effective")

## ----comment = "", message = FALSE, fig.width = 8, fig.height = 4, dpi=300, out.width=600, out.height=300----
diag(lslx_sem$extract_coefficient_acov(selector = "abic", type = "effective"))

