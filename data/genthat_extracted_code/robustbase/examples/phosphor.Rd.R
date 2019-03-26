library(robustbase)


### Name: phosphor
### Title: Phosphorus Content Data
### Aliases: phosphor
### Keywords: datasets

### ** Examples

data(phosphor)
plot(phosphor)
summary(lm.phosphor <- lm(plant ~ ., data = phosphor))
summary(lts.phosphor <- ltsReg(plant ~ ., data = phosphor))

phosphor.x <- data.matrix(phosphor[, 1:2])
cPh <- covMcd(phosphor.x)
plot(cPh, "dd")



