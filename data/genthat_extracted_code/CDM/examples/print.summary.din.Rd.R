library(CDM)


### Name: print.summary.din
### Title: Print Method for Objects of Class summary.din
### Aliases: print.summary.din
### Keywords: methods print

### ** Examples

##
## (1) examples based on dataset fractions.subtraction.data
##

## In particular, accessing detailed summary through assignment
mod <- CDM::din(data=CDM::fraction.subtraction.data,
          q.matrix=CDM::fraction.subtraction.qmatrix, rule="DINA")
smod <- summary(mod)
str(smod)



