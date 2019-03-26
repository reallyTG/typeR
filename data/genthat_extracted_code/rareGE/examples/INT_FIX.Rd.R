library(rareGE)


### Name: INT_FIX
### Title: Gene-environment interaction test treating genetic main effects
###   as fixed
### Aliases: INT_FIX
### Keywords: gene-environment interaction rare variant

### ** Examples

data(rareGEgeno)
data(rareGEpheno)
# quantitative traits - testing for gene-BMI interactions
INT_FIX(rareGEpheno$y1, rareGEgeno, rareGEpheno[, c("bmi", "age", "sex")])
# dichotomous traits - testing for gene-BMI interactions
INT_FIX(rareGEpheno$y2, rareGEgeno, rareGEpheno[, c("bmi", "age", "sex")], 
	family = "binomial")



