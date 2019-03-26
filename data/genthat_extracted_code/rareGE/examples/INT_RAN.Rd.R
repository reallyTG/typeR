library(rareGE)


### Name: INT_RAN
### Title: Gene-environment interaction test treating genetic main effects
###   as random
### Aliases: INT_RAN
### Keywords: gene-environment interaction rare variant

### ** Examples

data(rareGEgeno)
data(rareGEpheno)
# quantitative traits - testing for gene-BMI interactions
INT_RAN(rareGEpheno$y1, rareGEgeno, rareGEpheno[, c("bmi", "age", "sex")])
# dichotomous traits - testing for gene-BMI interactions
INT_RAN(rareGEpheno$y2, rareGEgeno, rareGEpheno[, c("bmi", "age", "sex")], 
	family = "binomial")



