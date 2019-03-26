library(lawstat)


### Name: gini.index
### Title: Measures of Relative Variability - Gini Index
### Aliases: gini.index
### Keywords: htest

### ** Examples

## The Baker v. Carr Case: one-person-one-vote decision. 
## Measure of Relative Inequality of Population data in 33 districts 
## of the Tennessee Legislature in 1900 and 1972. See 
## popdata (see Gastwirth (1988)).

data(popdata)
gini.index(popdata[,"pop1900"])

## Measures of Relative Variability  - Gini Index
##
## data:  popdata[, "pop1900"]
## Gini Index = 0.1147, delta = 3389.765

gini.index(popdata[,"pop1972"])

## Measures of Relative Variability  - Gini Index
##
## data:  popdata[, "pop1972"]
## Gini Index = 0.0055, delta = 1297.973



