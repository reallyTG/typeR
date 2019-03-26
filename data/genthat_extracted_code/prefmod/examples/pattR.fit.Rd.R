library(prefmod)


### Name: pattR.fit
### Title: Function to fit a pattern model for (partial) rankings
### Aliases: pattR.fit
### Keywords: models multivariate

### ** Examples

# fit of Critchlov & Fligner (1991) Salad Dressings Data
pattR.fit(salad, nitems = 4)

# alternatively use glm() with patt.design()
sal <- patt.design(salad, nitems = 4, resptype = "ranking")
glm(y ~ A+B+C+D, data = sal, family = poisson)



