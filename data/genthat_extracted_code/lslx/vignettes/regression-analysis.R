## ----comment = "", message = FALSE, setup, include=FALSE------------------------------------------
options(digits = 3)
options(width = 100)

## ----comment = "", message = FALSE----------------------------------------------------------------
set.seed(9487)
x <- matrix(rnorm(2000), 200, 10)
colnames(x) <- paste0("x", 1:10)
y <- matrix(rnorm(200), 200, 1)
data_reg <- data.frame(y, x)

## ----comment = "", message = FALSE----------------------------------------------------------------
model_reg <- "y <= x1 + x2 + x3 + x4
              y <~ x5 + x6 + x7 + x8 + x9 + x10"

## ----comment = "", message = FALSE----------------------------------------------------------------
library(lslx)
lslx_reg <- lslx$new(model = model_reg, data = data_reg)

## ----comment = "", message = FALSE----------------------------------------------------------------
lslx_reg$fit(penalty_method = "lasso", lambda_grid = seq(.00, .30, .01))

## ----comment = "", message = FALSE, fig.width = 24, fig.height = 14-------------------------------
lslx_reg$summarize(selector = "aic")

## ----comment = "", message = FALSE, fig.width = 8, fig.height = 4, dpi=200, out.width=600, out.height=300----
lslx_reg$plot_numerical_condition()

## ----comment = "", message = FALSE, fig.width = 8, fig.height = 4, dpi=200, out.width=600, out.height=300----
lslx_reg$plot_information_criterion()

## ----comment = "", message = FALSE, fig.width = 8, fig.height = 4, dpi=200, out.width=600, out.height=300----
lslx_reg$plot_fit_index()

## ----comment = "", message = FALSE, fig.width = 8, fig.height = 4, dpi=200, out.width=600, out.height=300----
lslx_reg$plot_coefficient(block = "y<-y")

## ----comment = "", message = FALSE, fig.width = 8, fig.height = 4, dpi=300, out.width=600, out.height=300----
lslx_reg$extract_coefficient(selector = "aic")

## ----comment = "", message = FALSE, fig.width = 8, fig.height = 4, dpi=300, out.width=600, out.height=300----
lslx_reg$extract_objective_gradient(selector = "aic", type = "effective")

