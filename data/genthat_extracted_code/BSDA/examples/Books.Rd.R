library(BSDA)


### Name: Books
### Title: Number of books read and final spelling scores for 17 third
###   graders
### Aliases: Books
### Keywords: datasets

### ** Examples


plot(spelling ~ book, data = Books)
mod <- lm(spelling ~ book, data = Books)
summary(mod)
abline(mod, col = "blue", lwd = 2)




