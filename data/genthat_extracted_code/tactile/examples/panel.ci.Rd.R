library(tactile)


### Name: panel.ci
### Title: Panel function for confidence interval
### Aliases: panel.ci

### ** Examples

mod <- lm(Petal.Width ~ Petal.Length*Species, data = iris)
newdat <- expand.grid(Petal.Length = seq(1, 7, by = 0.1),
                      Species = c("setosa", "versicolor", "virginica"))
pred <- predict(mod, newdat, interval = "confidence")
dd <- cbind(newdat, pred)

xyplot(fit ~ Petal.Length, groups = Species, data = dd,
       prepanel = prepanel.ci, auto.key = list(lines = TRUE, points = FALSE),
       ylab = "Petal Width",
       xlab = "Petal Length",
       lower = dd$lwr, upper = dd$upr, type = "l",
       panel = function(...) {
         panel.ci(..., alpha = 0.15, grid = TRUE)
         panel.xyplot(...)
       })




