library(Smisc)


### Name: comboList
### Title: Produces all possible combinations of a set of linear model
###   predictors
### Aliases: comboList
### Keywords: misc

### ** Examples

x <- comboList(4)
print(x)

# A parallel job
y <- comboList(4, njobs = 2)

# Should be equal
identical(x, y)



