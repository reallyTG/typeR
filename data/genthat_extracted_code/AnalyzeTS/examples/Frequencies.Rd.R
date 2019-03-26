library(AnalyzeTS)


### Name: Frequencies
### Title: Frequencies
### Aliases: Frequencies

### ** Examples

#Loading data
library(MASS)
attach(quine)

#Descriptive for a discrete variable
Frequencies(Age,plot=TRUE)

#Descriptive for discrete more variables
Frequencies(quine,answer=2,plot=TRUE)



