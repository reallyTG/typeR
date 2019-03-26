library(pmcgd)


### Name: class
### Title: Matrix of Indicator Variables given Classification
### Aliases: class

### ** Examples


n <- 20
k <- 3
prob <- c(0.5,0.3,0.2)
groups <- sample(1:k, size=n, replace = TRUE, prob = prob)
matclass <- class(groups, k)
matclass




