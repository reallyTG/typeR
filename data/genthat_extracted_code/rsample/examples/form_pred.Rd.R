library(rsample)


### Name: form_pred
### Title: Extract Predictor Names from Formula or Terms
### Aliases: form_pred

### ** Examples

form_pred(y ~ x + z)
form_pred(terms(y ~ x + z))

form_pred(y ~ x + log(z))
form_pred(log(y) ~ x + z)

form_pred(y1 + y2 ~ x + z)
form_pred(log(y1) + y2 ~ x + z)

# will fail:
# form_pred(y ~ .)

form_pred(terms(Species ~ (.)^2, data = iris))
form_pred(terms( ~ (.)^2, data = iris))



