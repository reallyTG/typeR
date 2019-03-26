library(PROscorerTools)


### Name: scoreScale
### Title: Flexible function to score a single PRO or other psychometric
###   scale
### Aliases: scoreScale

### ** Examples

# Make a data frame using default settings of makeFakeData() function
# (20 respondents, 9 items with values 0 to 4, and about 20% missing)
dat <- makeFakeData()

# First "sum" score the items, then "mean" score them
scoreScale(dat, type = "sum")
scoreScale(dat, type = "mean")

# Must use "minmax" argument if the "type" argument is "100"
scoreScale(dat, type = "100", minmax = c(0, 4))
# If you omit "type", the default is "pomp" (which is identical to "100")
scoreScale(dat, minmax = c(0, 4))

# "minmax" is also required if any items need to be reverse coded for scoring
#  Below, the first two items are reverse coded before scoring
scoreScale(dat, type = "sum", revitems = c("q1", "q2"), minmax = c(0, 4))



