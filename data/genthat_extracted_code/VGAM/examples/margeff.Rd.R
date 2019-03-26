library(VGAM)


### Name: margeff
### Title: Marginal Effects for Several Categorical Response Models
### Aliases: margeff
### Keywords: models regression

### ** Examples

# Not a good example for multinomial() because the response is ordinal!!
ii <- 3; hh <- 1/100
pneumo <- transform(pneumo, let = log(exposure.time))
fit <- vglm(cbind(normal, mild, severe) ~ let, multinomial, data = pneumo)
fit <- vglm(cbind(normal, mild, severe) ~ let,
            cumulative(reverse = TRUE,  parallel = TRUE),
            data = pneumo)
fitted(fit)[ii, ]

mynewdata <- with(pneumo, data.frame(let = let[ii] + hh))
(newp <- predict(fit, newdata = mynewdata, type = "response"))

# Compare the difference. Should be the same as hh --> 0.
round(digits = 3, (newp-fitted(fit)[ii, ])/hh)  # Finite-difference approxn
round(digits = 3, margeff(fit, subset = ii)["let",])

# Other examples
round(digits = 3, margeff(fit))
round(digits = 3, margeff(fit, subset = 2)["let",])
round(digits = 3, margeff(fit, subset = c(FALSE, TRUE))["let",,])  # recycling
round(digits = 3, margeff(fit, subset = c(2, 4, 6, 8))["let",,])



