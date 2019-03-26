library(simpleboot)


### Name: one.boot
### Title: One sample bootstrap of a univariate statistic.
### Aliases: one.boot
### Keywords: univar

### ** Examples

set.seed(20)
x <- rgamma(100, 1)
b.mean <- one.boot(x, mean, 1000)
print(b.mean)
boot.ci(b.mean)  ## No studentized interval here
hist(b.mean)

## This next line could take some time on a slow computer
b.median <- one.boot(x, median, R = 500, student = TRUE, M = 50)
boot.ci(b.median)
hist(b.median)

## Bootstrap with weights
set.seed(10)
w <- runif(100)
bw <- one.boot(x, median, 1000, weights = w)
print(bw)

## Studentized
bw.stud <- one.boot(x, median, R = 500, student = TRUE, M = 50,
                    weights = w)
boot.ci(bw.stud, type = "stud")



