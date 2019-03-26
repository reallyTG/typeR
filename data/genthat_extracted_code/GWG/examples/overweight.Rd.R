library(GWG)


### Name: overweight
### Title: Probabilities for inadequate or excessive gestational weight
###   gain (GWG) for overweight women for different months in pregnancy
### Aliases: overweight
### Keywords: posterior probability

### ** Examples

options(digits=3)

overweight(0.65,5, "excessive")

#For an overweight woman in Germany whose weight gain is excessive in the
#5th month of pregnancy (a priori risk = 0.65) the probability of excessive
#total GWG at the end of pregnancy is 0.901

overweight(0.07,5, "inadequate")

#For an overweight woman in Germany whose weight gain is inadequate in the
#5th month of pregnancy (a priori risk = 0.07) the probability of inadequate
#total GWG at the end of pregnancy is 0.128




