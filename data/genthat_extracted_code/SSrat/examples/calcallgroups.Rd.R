library(SSrat)


### Name: calcallgroups
### Title: Calculates the social status determinations of multiple groups.
### Aliases: calcallgroups
### Keywords: Data Functions Manipulation data datagen for generating manip
###   sets

### ** Examples


data(example5.rat)
calcgroup (school=1, group=23, data=example5.rat, scalelength="3")$dataframe
calcallgroups(example5.rat)

#readmultiple groups
data(example6.rat)
calcallgroups(example6.rat)

data(example7.rat)
calcallgroups(example7.rat) # Wrong!
calcgroup (school=1, group=1, dataframe=example7.rat, scalelength="7")$dataframe
calcgroup (school=1, group=3, dataframe=example7.rat, scalelength="7")$dataframe
calcgroup (school=2, group=1, dataframe=example7.rat, scalelength="7")$dataframe

#use names
data(example1a.rat)
calcallgroups(example1a.rat)




