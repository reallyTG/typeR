library(doBy)


### Name: firstlastobs
### Title: Locate the index of the first/last unique value
### Aliases: firstlastobs lastobs firstobs firstobs.default lastobs.default
###   firstobs.formula lastobs.formula
### Keywords: utilities

### ** Examples



x <- c(rep(1, 5), rep(2, 3), rep(3, 7), rep(1, 4))

firstobs(x)
lastobs(x)

data(dietox)

firstobs(~Pig, data=dietox)
lastobs(~Pig, data=dietox)




