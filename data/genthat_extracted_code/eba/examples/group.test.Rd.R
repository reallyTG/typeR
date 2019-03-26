library(eba)


### Name: group.test
### Title: Group Effects in Elimination-by-Aspects (EBA) Models
### Aliases: group.test print.group.test
### Keywords: models

### ** Examples

## Bradley-Terry-Luce model
data(pork)          # Is there a difference between Judge 1 and Judge 2?
groups <- array(c(apply(pork[, , 1:5],  1:2, sum),
                  apply(pork[, , 6:10], 1:2, sum)), c(3,3,2))
group.test(groups)  # Yes, there is.

## Elimination-by-aspects model
data(drugrisk)   # Do younger and older males judge risk of drugs differently?
A2 <- list(c(1), c(2,7), c(3,7), c(4,7,8), c(5,7,8), c(6,7,8))
group.test(drugrisk[, , 3:4], A2)  # Yes.



