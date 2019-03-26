library(DAAG)


### Name: spam7
### Title: Spam E-mail Data
### Aliases: spam7
### Keywords: datasets

### ** Examples

require(rpart)
spam.rpart <- rpart(formula = yesno ~ crl.tot + dollar + bang +
   money + n000 + make, data=spam7)
plot(spam.rpart)
text(spam.rpart)




