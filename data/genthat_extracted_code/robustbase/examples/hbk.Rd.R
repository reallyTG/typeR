library(robustbase)


### Name: hbk
### Title: Hawkins, Bradu, Kass's Artificial Data
### Aliases: hbk
### Keywords: datasets

### ** Examples

data(hbk)
plot(hbk)
summary(lm.hbk <- lm(Y ~ ., data = hbk))

hbk.x <- data.matrix(hbk[, 1:3])
(cHBK <- covMcd(hbk.x))



