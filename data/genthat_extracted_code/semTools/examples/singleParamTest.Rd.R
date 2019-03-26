library(semTools)


### Name: singleParamTest
### Title: Single Parameter Test Divided from Nested Model Comparison
### Aliases: singleParamTest

### ** Examples


library(lavaan)

# Nested model comparison by hand
HS.model1 <- ' visual =~ x1 + x2 + x3
              textual =~ x4 + x5 + x6'
HS.model2 <- ' visual =~ a*x1 + a*x2 + a*x3
              textual =~ b*x4 + b*x5 + b*x6'

m1 <- cfa(HS.model1, data = HolzingerSwineford1939, std.lv = TRUE,
          estimator = "MLR")
m2 <- cfa(HS.model2, data = HolzingerSwineford1939, std.lv = TRUE,
          estimator = "MLR")
anova(m1, m2)
singleParamTest(m1, m2)

## Nested model comparison from the measurementInvariance function
HW.model <- ' visual =~ x1 + x2 + x3
              textual =~ x4 + x5 + x6
              speed =~ x7 + x8 + x9 '

models <- measurementInvariance(model = HW.model, data = HolzingerSwineford1939,
                                group = "school")
singleParamTest(models[[1]], models[[2]])

## Note that the comparison between weak (Model 2) and scalar invariance
## (Model 3) cannot be done by this function # because the weak invariance
## model fixes factor means as 0 in Group 2 but the strong invariance model
## frees the factor means in Group 2. Users may try to compare
## strong (Model 3) and means invariance models by this function.




