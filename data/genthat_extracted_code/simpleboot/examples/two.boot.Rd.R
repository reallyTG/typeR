library(simpleboot)


### Name: two.boot
### Title: Two sample bootstrap of differences between univariate
###   statistics.
### Aliases: two.boot
### Keywords: univar

### ** Examples

set.seed(50)
x <- rnorm(100, 1)  ## Mean 1 normals
y <- rnorm(100, 0)  ## Mean 0 normals
b <- two.boot(x, y, median, R = 1000)
boot.ci(b)  ## No studentized confidence intervals
hist(b)  ## Histogram of the bootstrap replicates

b <- two.boot(x, y, quantile, R = 1000, probs = .75)

## With weighting

## Here all members of the first group has equal weighting
## but members of the the second have unequal weighting
w <- list(rep(1, 100), 100:1)
bw <- two.boot(x, y, median, R = 1000, weights = w)
boot.ci(b)

## Studentized
bstud <- two.boot(x, y, median, R = 500, student = TRUE, M = 50)
boot.ci(bstud, type = "stud")

## Studentized with weights
bwstud <- two.boot(x, y, median, R = 500, student = TRUE, M = 50,
                   weights = w)
boot.ci(bstud, type = "stud")



