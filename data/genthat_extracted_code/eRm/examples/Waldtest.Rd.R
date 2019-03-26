library(eRm)


### Name: Waldtest
### Title: Item-Specific Wald Test
### Aliases: Waldtest Waldtest.Rm print.wald
### Keywords: models

### ** Examples

#Wald test for Rasch model with user-defined subject split
res <- RM(raschdat2)
splitvec <- sample(1:2,25,replace=TRUE)
Waldtest(res, splitcr = splitvec)



