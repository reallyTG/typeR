library(epiDisplay)


### Name: shapiro.qqnorm
### Title: Qqnorm plots with Shapiro-Wilk's test
### Aliases: shapiro.qqnorm
### Keywords: htest

### ** Examples

x <- rnorm(10)
a <- LETTERS[1:10]
shapiro.qqnorm(x, pch=a, col="red")
qqline(x, lty=2, col="black")



