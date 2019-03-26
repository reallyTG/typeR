library(GWG)


### Name: obese
### Title: Probabilities for inadequate or excessive gestational weight
###   gain (GWG) for obese women for different months in pregnancy
### Aliases: obese
### Keywords: posterior probability

### ** Examples

options(digits=3)

obese(0.65,5, "excessive")

#For an obese woman in Germany whose weight gain is excessive in the
#5th month of pregnancy (a priori risk = 0.65) the probability of excessive
#total GWG at the end of pregnancy is 0.894

obese(0.13,5, "inadequate")

#For an obese woman in Germany whose weight gain is inadequate in the
#5th month of pregnancy (a priori risk = 0.13) the probability of inadequate
#total GWG at the end of pregnancy is 0.288



