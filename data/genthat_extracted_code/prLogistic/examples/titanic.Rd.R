library(prLogistic)


### Name: titanic
### Title: Titanic Data
### Aliases: titanic
### Keywords: datasets

### ** Examples

data("titanic", package = "prLogistic")
attach(titanic)
dim(titanic)
library(Hmisc)
describe(as.factor(pclass))
table(survived,pclass)
glm(survived ~ as.factor(pclass), family=binomial, data=titanic)



