library(fastR)


### Name: familySmoking
### Title: Family smoking
### Aliases: familySmoking
### Keywords: datasets

### ** Examples


data(familySmoking)
xchisq.test( xtabs(~Parents + Student, familySmoking) )




