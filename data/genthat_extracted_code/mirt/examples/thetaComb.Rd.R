library(mirt)


### Name: thetaComb
### Title: Create all possible combinations of vector input
### Aliases: thetaComb

### ** Examples


# all possible joint combinations for the vector -4 to 4
thetaComb(-4:4, 2)

# all possible binary combinations for four observations
thetaComb(c(0,1), 4)

# all possible binary combinations for four observations (with intercept)
thetaComb(c(0,1), 4, intercept=TRUE)




