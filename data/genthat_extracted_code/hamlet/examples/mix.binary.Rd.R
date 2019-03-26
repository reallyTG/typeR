library(hamlet)


### Name: mix.binary
### Title: Binary coding of categorical variables
### Aliases: mix.binary
### Keywords: manip

### ** Examples

data(vcapwide)

ex <- mix.binary(vcapwide[,c("Group", "CastrationDate")])
apply(ex, MARGIN=1, FUN=sum) 
# Notice that each row sums to 2, as two categorical variables were binary coded 
# and no missing values were present

mix.binary(vcapwide[,c("PSAWeek4", "Group", "CastrationDate")]) 
# Binary coding is only applied to non-numeric fields



