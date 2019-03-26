library(insight)


### Name: find_response
### Title: Find name of the response variable
### Aliases: find_response

### ** Examples

library(lme4)
data(cbpp)
cbpp$trials <- cbpp$size - cbpp$incidence
m <- glm(cbind(incidence, trials) ~ period, data = cbpp, family = binomial)

find_response(m, combine = TRUE)
find_response(m, combine = FALSE)



