library(insight)


### Name: get_response
### Title: Get the values from the response variable
### Aliases: get_response

### ** Examples

library(lme4)
data(cbpp)
data(mtcars)
cbpp$trials <- cbpp$size - cbpp$incidence

m <- glm(cbind(incidence, trials) ~ period, data = cbpp, family = binomial)
head(get_response(m))
get_response(m, resp = "incidence")

m <- lm(mpg ~ wt + cyl + vs, data = mtcars)
get_response(m)



