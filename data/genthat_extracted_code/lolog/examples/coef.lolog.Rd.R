library(lolog)


### Name: coef.lolog
### Title: Extracts estimated model coefficients.
### Aliases: coef.lolog

### ** Examples

# Extract parameter estimates as a numeric vector:
data(ukFaculty)
fit <- lolog(ukFaculty ~ edges)
coef(fit)



