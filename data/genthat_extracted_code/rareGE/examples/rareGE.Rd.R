library(rareGE)


### Name: rareGE
### Title: Tests for gene-environment interaction and joint test of genetic
###   main effects and gene-environment interaction
### Aliases: rareGE
### Keywords: gene-environment interaction rare variant joint test

### ** Examples

set.seed(12345)
data(rareGEgeno)
data(rareGEpheno)
# quantitative traits - testing for gene-BMI interactions
rareGE(rareGEpheno$y1, rareGEgeno, rareGEpheno[, c("bmi", "age", "sex")],
	B = 1000)
# dichotomous traits - testing for gene-BMI interactions
rareGE(rareGEpheno$y2, rareGEgeno, rareGEpheno[, c("bmi", "age", "sex")],
	family = "binomial", B = 1000)



