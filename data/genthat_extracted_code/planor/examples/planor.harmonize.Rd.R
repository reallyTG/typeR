library(planor)


### Name: planor.harmonize
### Title: Harmonize the Factors
### Aliases: planor.harmonize
### Keywords: design design

### ** Examples

F2 <- planor.factors(factors=c("block",LETTERS[1:4]), nlevels=c(6,6,6,4,2))
M2 <- planor.model( model=~block+(A+B+C)^2, estimate=~A+B+C )
F2.h <- planor.harmonize(factors=F2, model=M2, base=~A+B)
names(F2)
names(F2.h)



