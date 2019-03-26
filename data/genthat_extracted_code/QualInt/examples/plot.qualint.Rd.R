library(QualInt)


### Name: plot.qualint
### Title: Plot the interval based graph from a "qualint" object
### Aliases: plot.qualint

### ** Examples

ynorm <- rnorm(300)
trtment <- sample(c(0, 1), 300, prob = c(0.4, 0.6),
                  replace = TRUE)
subgrp <- sample(c(0, 1, 2), 300, prob = c(1/3, 1/3, 1/3),
                 replace = TRUE)
test1 <- qualint(ynorm, trtment, subgrp)
plot(test1)



