## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 4,
  fig.height = 3.2
)

## ----model---------------------------------------------------------------
mod <- lm(Petal.Width ~ Petal.Length*Species, data = iris)
newdat <- expand.grid(Petal.Length = seq(1, 7, by = 0.1),
                     Species = c("setosa", "versicolor", "virginica"))
pred <- predict(mod, newdat, interval = "confidence")
dd <- cbind(newdat, pred)

## ----panel-ci, fig.cap="Example of using panel.ci."----------------------
library(tactile)
xyplot(fit ~ Petal.Length, groups = Species, data = dd,
       prepanel = prepanel.ci, auto.key = list(lines = TRUE, points = FALSE),
       ylab = "Petal Width",
       xlab = "Petal Length",
       lower = dd$lwr,
       upper = dd$upr,
       type = "l",
        panel = function(...) {
          panel.ci(..., alpha = 0.15, grid = TRUE)
          panel.xyplot(...)
        })

## ----qqmath, fig.cap="Example of using panel.qqmathci."------------------
qqmath(~ height | voice.part, aspect = "xy", data = singer,
       prepanel = prepanel.qqmathline,
       distribution = qnorm,
       ci = 0.9,
       panel = function(x, ...) {
         panel.qqmathci(x, ...)
         panel.qqmathline(x, ...)
         panel.qqmath(x, ...)
       })

