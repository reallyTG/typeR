params <-
structure(list(figpath = "lspline-"), .Names = "figpath")

## ----setup, include=FALSE, cache=FALSE-----------------------------------
knitr::opts_chunk$set(
  cache=FALSE,
  collapse=TRUE,
  fig.path = params$figpath
  )

## ----badges, echo=FALSE, results="asis", eval=knitr::opts_knit$get("rmarkdown.pandoc.to") == "markdown_github"----
#  cat("
#  [![Build Status](https://travis-ci.org/mbojan/lspline.png?branch=master)](https://travis-ci.org/mbojan/lspline)
#  [![Build Status](https://ci.appveyor.com/api/projects/status/lupt5o61rsqwqt97?svg=true)](https://ci.appveyor.com/project/mbojan/lspline)
#  [![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/lspline?color=2ED968)](http://cranlogs.r-pkg.org/)
#  [![cran version](http://www.r-pkg.org/badges/version/lspline)](https://cran.r-project.org/package=lspline)
#      ")

## ----data----------------------------------------------------------------
set.seed(666)
n <- 200
d <- data.frame(
  x = scales::rescale(rchisq(n, 6), c(0, 20))
)
d$interval <- findInterval(d$x, c(5, 10), rightmost.closed = TRUE) + 1
d$slope <- c(2, -3, 0)[d$interval]
d$intercept <- c(0, 25, -5)[d$interval]
d$y <- with(d, intercept + slope * x + rnorm(n, 0, 1))

## ----show_data-----------------------------------------------------------
library(ggplot2)
fig <- ggplot(d, aes(x=x, y=y)) + 
  geom_point(aes(shape=as.character(slope))) +
  scale_shape_discrete(name="Slope") +
  theme_bw()
fig

## ----lspline_nonmarginal-------------------------------------------------
library(lspline)
m1 <- lm(y ~ lspline(x, c(5, 10)), data=d)
knitr::kable(broom::tidy(m1))

## ----rspline_marginal, echo=1:2------------------------------------------
m2 <- lm(y ~ lspline(x, c(5,10), marginal=TRUE), data=d)
knitr::kable(broom::tidy(m2))
k <- coef(m2)
nam <- names(k)

## ----same-fitted---------------------------------------------------------
all.equal( fitted(m1), fitted(m2) )

## ----lspline_fitted------------------------------------------------------
fig +
  geom_smooth(method="lm", formula=formula(m1), se=FALSE) +
  geom_vline(xintercept = c(5, 10), linetype=2)

## ----elspline------------------------------------------------------------
m3 <- lm(y ~ elspline(x, 3), data=d)
knitr::kable(broom::tidy(m3))

## ----elspline-fitted-----------------------------------------------------
fig +
  geom_smooth(aes(group=1), method="lm", formula=formula(m3), se=FALSE, n=200)

## ----qlspline------------------------------------------------------------
m4 <- lm(y ~ qlspline(x, 4), data=d)
knitr::kable(broom::tidy(m4))

## ----qlspline-fitted-----------------------------------------------------
fig +
  geom_smooth(method="lm", formula=formula(m4), se=FALSE, n=200)

## ----installation, eval=FALSE--------------------------------------------
#  devtools::install_github("mbojan/lspline", build_vignettes=TRUE)

