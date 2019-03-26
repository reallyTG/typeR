library(hamlet)


### Name: mix.fun
### Title: Apply function to numerical columns of a mixed data.frame while
###   ignoring non-numeric fields
### Aliases: mix.fun
### Keywords: manip

### ** Examples

data(vcapwide)

mix.fun(vcapwide[,c("Group", "PSAWeek4", "PSAWeek10", "PSAWeek14")], FUN=scale) 
# Column 'Group' is ignored
mix.fun(vcapwide[,c("Group", "PSAWeek4", "PSAWeek10", "PSAWeek14")], FUN=cov, use="na.or.complete") 
# ... is used to pass the 'use' parameter to the 'cov'-function



