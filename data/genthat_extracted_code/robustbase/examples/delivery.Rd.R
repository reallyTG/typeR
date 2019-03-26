library(robustbase)


### Name: delivery
### Title: Delivery Time Data
### Aliases: delivery
### Keywords: datasets

### ** Examples

data(delivery)
summary(lm.deli <- lm(delTime ~ ., data = delivery))

delivery.x <- as.matrix(delivery[, 1:2])
c_deli <- covMcd(delivery.x)
c_deli



