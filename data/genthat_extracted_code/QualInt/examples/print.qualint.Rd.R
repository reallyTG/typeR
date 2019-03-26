library(QualInt)


### Name: print.qualint
### Title: Print a summary of a "qualint" object
### Aliases: print.qualint

### ** Examples

ynorm <- rnorm(300)
trtment <- sample(c(0, 1), 300, prob = c(0.4, 0.6),
                  replace = TRUE)
subgrp <- sample(c(0, 1, 2), 300, prob = c(1/3, 1/3, 1/3),
                 replace = TRUE)
test1 <- qualint(ynorm, trtment, subgrp)
print(test1)



