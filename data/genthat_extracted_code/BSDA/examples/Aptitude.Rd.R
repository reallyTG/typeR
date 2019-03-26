library(BSDA)


### Name: Aptitude
### Title: Aptitude test scores versus productivity in a factory
### Aliases: Aptitude
### Keywords: datasets

### ** Examples


plot(product ~ aptitude, data = Aptitude, main = "Exercise 2.1")
model1 <- lm(product ~ aptitude, data = Aptitude)
model1
abline(model1, col = "red", lwd=3)
resid(model1)
fitted(model1)
cor(Aptitude$product, Aptitude$aptitude)




