library(pipeliner)


### Name: estimate_model
### Title: Estimate machine learning model
### Aliases: estimate_model

### ** Examples

data <- head(faithful)
f <- estimate_model(function(df) {
  lm(eruptions ~ 1 + waiting, df)
})

f(data)
# Call:
#   lm(formula = eruptions ~ 1 + waiting, data = df)
#
# Coefficients:
# (Intercept)      waiting
#    -1.53317      0.06756



