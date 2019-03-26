library(SSrat)


### Name: calcgroup
### Title: Calculates sociometric status determinations of a specified
###   single group from a SSrat compliant dataframe
### Aliases: calcgroup
### Keywords: List list

### ** Examples


data(example5.rat)
# calc SSRAT results fot this group
out =calcgroup (school=1, group=23, data=example5.rat, scalelength="3")
out$dataframe

# calc Newcomb & Bukowski results for this group
out =calcgroup (school=1, group=23, data=example5.rat, scalelength="3", NBcriteria=TRUE)
out$dataframe

# calc Newcomb & Bukowski results for example1
data(example1.rat)
out =calcgroup (school=1, group=1, data=example1.rat, scalelength="7", NBcriteria=TRUE)
out$dataframe

# calc SSrat results for example1
out =calcgroup (school=1, group=1, data=example1.rat, scalelength="7")
out$dataframe




