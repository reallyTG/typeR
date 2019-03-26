library(odds.n.ends)


### Name: odds.n.ends
### Title: A logistic regression function
### Aliases: odds.n.ends
### Keywords: fit glm logistic odds

### ** Examples

sick <- c(0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1)
age <- c(23, 25, 26, 34, 54, 46, 48, 95, 81, 42, 62, 25, 31, 49, 57, 52, 54, 63, 61, 50)
logisticModel <- glm(sick ~ age, na.action = na.exclude, family = binomial(logit))
odds.n.ends(logisticModel)



