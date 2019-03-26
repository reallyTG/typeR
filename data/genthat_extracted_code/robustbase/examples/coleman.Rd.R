library(robustbase)


### Name: coleman
### Title: Coleman Data Set
### Aliases: coleman
### Keywords: datasets

### ** Examples

data(coleman)
pairs(coleman)
summary( lm.coleman <-     lm(Y ~ . , data = coleman))
summary(lts.coleman <- ltsReg(Y ~ . , data = coleman))

coleman.x <- data.matrix(coleman[, 1:6])
(Cc <- covMcd(coleman.x))



