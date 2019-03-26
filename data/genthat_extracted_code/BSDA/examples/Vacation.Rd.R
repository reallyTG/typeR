library(BSDA)


### Name: Vacation
### Title: Number of days of paid holidays and vacation leave for sample of
###   35 textile workers
### Aliases: Vacation
### Keywords: datasets

### ** Examples


boxplot(Vacation$number, col = "violet")
hist(Vacation$number, main = "Exercise 6.46", col = "blue",
     xlab = "number of days of paid holidays and vacation leave taken")
     t.test(Vacation$number, mu = 24)




