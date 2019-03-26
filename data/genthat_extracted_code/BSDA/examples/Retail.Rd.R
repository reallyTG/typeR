library(BSDA)


### Name: Retail
### Title: Length of employment versus gross sales for 10 employees of a
###   large retail store
### Aliases: Retail
### Keywords: datasets

### ** Examples


plot(sales ~ months, data = Retail)
model <- lm(sales ~ months, data = Retail)
abline(model, col = "blue")
summary(model)




