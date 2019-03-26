library(tactile)


### Name: prepanel.ci
### Title: Prepanel for ciplot
### Aliases: prepanel.ci

### ** Examples

mod <- lm(Petal.Width ~ Petal.Length*Species, data = iris)
newdat <- expand.grid(Petal.Length = seq(1, 7, by = 0.1),
                      Species = c("setosa", "versicolor", "virginica"))
pred <- predict(mod, newdat, interval = "confidence")
dd <- cbind(newdat, pred)

xyplot(fit ~ Petal.Length, groups = Species, data = dd,
       prepanel = prepanel.ci,
       ylab = "Petal Width",
       xlab = "Petal Length",
       lower = dd$lwr, upper = dd$upr, alpha = 0.3,
       panel = function(...) {
         panel.ci(..., grid = TRUE)
         panel.xyplot(type = "l", ...)
       })




