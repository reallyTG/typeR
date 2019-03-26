library(margins)


### Name: margins
### Title: Marginal Effects Estimation
### Aliases: margins margins-package margins-package margins.betareg
###   margins.default margins.glm margins.lm margins.loess margins.merMod
###   margins.lmerMod margins.nnet margins.polr margins.svyglm
### Keywords: models package

### ** Examples

# basic example using linear model
require("datasets")
x <- lm(mpg ~ cyl * hp + wt, data = head(mtcars))
margins(x)

# obtain unit-specific standard errors
## Not run: 
##D   margins(x, unit_ses = TRUE)
## End(Not run)

# use of 'variables' argument to estimate only some MEs
summary(margins(x, variables = "hp"))

# use of 'at' argument
## modifying original data values
margins(x, at = list(hp = 150))
## AMEs at various data values
margins(x, at = list(hp = c(95, 150), cyl = c(4,6)))

# use of 'data' argument to obtain AMEs for a subset of data
margins(x, data = mtcars[mtcars[["cyl"]] == 4,])
margins(x, data = mtcars[mtcars[["cyl"]] == 6,])

# return discrete differences for continuous terms
## passes 'change' through '...' to dydx()
margins(x, change = "sd")

# summary() method
summary(margins(x, at = list(hp = c(95, 150))))
## control row order of summary() output
summary(margins(x, at = list(hp = c(95, 150))), by_factor = FALSE)

# alternative 'vce' estimation
## Not run: 
##D   # bootstrap
##D   margins(x, vce = "bootstrap", iterations = 100L)
##D   # simulation (ala Clarify/Zelig)
##D   margins(x, vce = "simulation", iterations = 100L)
## End(Not run)

# specifying a custom `vcov` argument
if (require("sandwich")) {
  x2 <- lm(Sepal.Length ~ Sepal.Width, data = head(iris))
  summary(margins(x2))
  ## heteroskedasticity-consistent covariance matrix
  summary(margins(x2, vcov = vcovHC(x2)))
}

# generalized linear model
x <- glm(am ~ hp, data = head(mtcars), family = binomial)
margins(x, type = "response")
margins(x, type = "link")

# multi-category outcome
if (requireNamespace("nnet")) {
  data("iris3", package = "datasets")
  ird <- data.frame(rbind(iris3[,,1], iris3[,,2], iris3[,,3]),
                    species = factor(c(rep("s",50), rep("c", 50), rep("v", 50))))
  m <- nnet::nnet(species ~ ., data = ird, size = 2, rang = 0.1,
                  decay = 5e-4, maxit = 200, trace = FALSE)
  margins(m) # default
  margins(m, category = "v") # explicit category
}




