library(personalized)


### Name: weighted.ksvm
### Title: Fit weighted kernel svm model.
### Aliases: weighted.ksvm

### ** Examples


library(kernlab)

x <- matrix(rnorm(200 * 2), ncol = 2)

y <- 2 * (sin(x[,2]) ^ 2 * exp(-x[,2]) - 0.2 > rnorm(200, sd = 0.1)) - 1

weights <- runif(100, max = 1.5, min = 0.5)

wk <- weighted.ksvm(x = x[1:100,], y = y[1:100], C = c(0.1, 0.5, 1, 2, 10),
                    weights = weights[1:100])

pr <- predict(wk, newx = x[101:200,])

mean(pr == y[101:200])




