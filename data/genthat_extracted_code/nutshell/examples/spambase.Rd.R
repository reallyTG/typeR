library(nutshell)


### Name: spambase
### Title: Spambase Data Set
### Aliases: spambase
### Keywords: datasets

### ** Examples

data(spambase)
table(spambase$is_spam)
# fit a linear disciminant analysis model to the data
library(MASS)
spam.lda <- qda(formula=is_spam~., data=spambase)



