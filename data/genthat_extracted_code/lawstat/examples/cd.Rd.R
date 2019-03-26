library(lawstat)


### Name: cd
### Title: Coefficient of Dispersion - A Measure of Relative Variability
### Aliases: cd
### Keywords: htest

### ** Examples

## The Baker v. Carr Case: one-person-one-vote decision. 
## Measure of Relative Inequality of Population data in 33 districts 
## of the Tennessee Legislature in 1900 and 1972. See 
## popdata (see Gastwirth, 1988).

data(popdata)
cd(popdata[,"pop1900"])

## Measures of Relative Variability  - Coefficient of Dispersion
##
## data:  popdata[, "pop1900"]
## Coefficient of Dispersion = 0.1673

cd(popdata[,"pop1972"])

## Measures of Relative Variability  - Coefficient of Dispersion
##
## data:  popdata[, "pop1972"]
## Coefficient of Dispersion = 0.0081



