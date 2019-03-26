library(HelpersMG)


### Name: ExtractAIC.glm
### Title: Return AIC, AICc or BIC from a glm object
### Aliases: ExtractAIC.glm

### ** Examples

extractAIC.glm <- ExtractAIC.glm
n <- 100
x <- rnorm(n, 20, 2)
A <- rnorm(n, 20, 5)
g <- glm(x ~ A)
extractAIC(g, show.option=TRUE)
options(AIC="AIC")
extractAIC(g)
options(AIC="BIC")
extractAIC(g)
options(AIC="AICc")
extractAIC(g)



