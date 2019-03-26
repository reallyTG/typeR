library(GWG)


### Name: normalweight
### Title: Probabilities for inadequate or excessive gestational weight
###   gain (GWG) for normal weight women for different months in pregnancy
### Aliases: normalweight
### Keywords: posterior probability

### ** Examples

options(digits=3)

normalweight(0.39,5, "excessive")

#For a normal weight woman in Germany whose weight gain is excessive in the 
#5th month of pregnancy (a priori risk = 0.39) the probability of excessive 
#total GWG at the end of pregnancy is 0.696

normalweight(0.19,5, "inadequate")

#For a normal weight woman in Germany whose weight gain is inadequate in the 
#5th month of pregnancy (a priori risk = 0.19) the probability of inadequate 
#total GWG at the end of pregnancy is 0.479



