## ----comment = "", message = FALSE, setup, include=FALSE------------------------------------------
options(digits = 3)
options(width = 100)

## ----comment = "", message = FALSE----------------------------------------------------------------
model_fa <- "visual  :=> x1 + x2 + x3
             textual :=> x4 + x5 + x6
             speed   :=> x7 + x8 + x9
             visual  :~> x4 + x5 + x6 + x7 + x8 + x9
             textual :~> x1 + x2 + x3 + x7 + x8 + x9
             speed   :~> x1 + x2 + x3 + x4 + x5 + x6
             visual  <=> fix(1)* visual
             textual <=> fix(1)* textual
             speed   <=> fix(1)* speed"

## ----comment = "", message = FALSE----------------------------------------------------------------
library(lslx)
lslx_fa <- lslx$new(model = model_fa, data = lavaan::HolzingerSwineford1939)

## ----comment = "", message = FALSE----------------------------------------------------------------
lslx_fa$extract_specification()

## ----comment = "", message = FALSE----------------------------------------------------------------
lslx_fa$fit(penalty_method = "mcp", 
            lambda_grid = seq(.01, .60, .01), 
            delta_grid = c(1.5, 3.0, Inf))

## ----comment = "", message = FALSE, fig.width = 24, fig.height = 14-------------------------------
lslx_fa$summarize(selector = "bic")

## ----comment = "", message = FALSE, fig.width = 8, fig.height = 4, dpi=200, out.width=600, out.height=300----
lslx_fa$plot_numerical_condition()

## ----comment = "", message = FALSE, fig.width = 8, fig.height = 4, dpi=200, out.width=600, out.height=300----
lslx_fa$plot_information_criterion()

## ----comment = "", message = FALSE, fig.width = 8, fig.height = 4, dpi=200, out.width=600, out.height=300----
lslx_fa$plot_fit_index()

## ----comment = "", message = FALSE, fig.width = 8, fig.height = 4, dpi=200, out.width=600, out.height=300----
lslx_fa$plot_coefficient(block = "y<-f")

## ----comment = "", message = FALSE, fig.width = 8, fig.height = 4, dpi=300, out.width=600, out.height=300----
lslx_fa$extract_coefficient_matrix(selector = "bic", block = "y<-f")

## ----comment = "", message = FALSE, fig.width = 8, fig.height = 4, dpi=300, out.width=600, out.height=300----
lslx_fa$extract_implied_cov(selector = "bic")

## ----comment = "", message = FALSE, fig.width = 8, fig.height = 4, dpi=300, out.width=600, out.height=300----
lslx_fa$extract_residual_cov(selector = "bic")

## ----comment = "", message = FALSE----------------------------------------------------------------
model_fa <- "visual  =~ x1 + x2 + x3
             textual =~ x4 + x5 + x6
             speed   =~ x7 + x8 + x9
             pen() * visual  =~ x4 + x5 + x6 + x7 + x8 + x9
             pen() * textual =~ x1 + x2 + x3 + x7 + x8 + x9
             pen() * speed   =~ x1 + x2 + x3 + x4 + x5 + x6
             visual  ~~ 1 * visual
             textual ~~ 1 * textual
             speed   ~~ 1 * speed"
             
lslx_fa <- plsem(model = model_fa, 
                 data = lavaan::HolzingerSwineford1939,
                 penalty_method = "mcp", 
                 lambda_grid = seq(.01, .60, .01), 
                 delta_grid = c(1.5, 3.0, Inf))

summary(lslx_fa, selector = "bic")

