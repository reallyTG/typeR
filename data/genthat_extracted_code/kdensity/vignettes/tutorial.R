## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----mpg_example_start, echo = TRUE--------------------------------------
library("kdensity")
kde = kdensity(mtcars$mpg, start = "gumbel", kernel = "gaussian")
kde(20)

## ----mpg_example_expectation, echo = TRUE--------------------------------
integrate(function(x) x*kde(x), lower = -Inf, upper = Inf)$value 

## ----mpg_example_plot, echo = TRUE,fig.height = 5, fig.width = 5, fig.align = "center"----
plot(kde, main = "Miles per Gallon")
lines(kde, plot_start = TRUE, col = "red")
rug(mtcars$mpg)

## ----mpg_example_plot_magrittr, echo = TRUE, eval = FALSE----------------
#  library("magrittr")
#  kde %>%
#    plot(main = "Miles per Gallon") %>%
#    lines(plot_start = TRUE, col = "red")

## ----mpg_example_generics, echo = TRUE-----------------------------------
coef(kde)
logLik(kde)
AIC(kde)

## ----mpg_example_summary, echo = TRUE------------------------------------
summary(kde)

## ----mpg_example_access, echo = TRUE-------------------------------------
kde$start_str 
kde[["x"]]

## ----mpg_example_changes, echo = TRUE------------------------------------
kde$bw = "RHE"
update(kde, start = "normal")

## ------------------------------------------------------------------------
normal = list(
  density = dnorm,
  
  estimator = function(data) {
    c(mean  = mean(data),
      sd    = sd(data))
  },
  
  support   = c(-Inf, Inf)
)

## ---- fig2, fig.height = 5, fig.width = 5, fig.align = "center"----------
LH = diff(LakeHuron)
kde_normal = kdensity(LH, start = "normal")
plot(kde_normal, lwd = 2, col = "black",
     main = "Lake Huron differences")

## ------------------------------------------------------------------------
skew_hyperbolic = list(
  density   = SkewHyperbolic::dskewhyp,
  
  estimator = function(x) {
    SkewHyperbolic::skewhypFit(x, printOut = FALSE)$param
  },
  
  support   = c(-Inf, Inf)
)

## ---- fig.height = 5, fig.width = 5, fig.align = "center"----------------
kde_skewhyp = kdensity(LH, start = skew_hyperbolic)
plot(kde_skewhyp, lwd = 2, col = "blue",
     main = "Lake Huron differences")
lines(kde_normal)
lines(kde_skewhyp, plot_start = TRUE, lty = 2, lwd = 2)
rug(LH)

## ------------------------------------------------------------------------
gaussian = list(
  kernel  = function(y, x, h) dnorm((y-x)/h),
  sd      = 1,
  support = c(-Inf, Inf))

