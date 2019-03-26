library(CDM)


### Name: summary.din
### Title: Summary Method for Objects of Class din
### Aliases: summary.din
### Keywords: methods summary

### ** Examples

##
## (1) examples based on dataset fractions.subtraction.data
##

## Parameter estimation of DINA model
# rule="DINA" is default
fractions.dina <- CDM::din(data=CDM::fraction.subtraction.data,
           q.matrix=CDM::fraction.subtraction.qmatrix, rule="DINA")

## corresponding summaries, including diagnostic accuracies,
## most frequent skill classes and information
## criteria AIC and BIC
summary(fractions.dina)

## In particular, accessing detailed summary through assignment
detailed.summary.fs <- summary(fractions.dina)
str(detailed.summary.fs)



