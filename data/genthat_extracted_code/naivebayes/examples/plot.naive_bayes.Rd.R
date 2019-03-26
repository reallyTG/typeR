library(naivebayes)


### Name: plot.naive_bayes
### Title: Plot Method for naive_bayes Object
### Aliases: plot.naive_bayes

### ** Examples

data(iris)
iris2 <- cbind(iris, New = sample(letters[1:3], 150, TRUE))
nb <- naive_bayes(Species ~ ., data = iris2)
plot(nb, ask = TRUE)
plot(nb, which = c(1, 2), ask = TRUE,
     arg.num = list(col = 1:3, lty = 1, main = "Naive Bayes Plot"))
plot(nb, which = "New", arg.cat = list(color = 4:7))



