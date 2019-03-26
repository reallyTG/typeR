library(PROscorerTools)


### Name: missTally
### Title: Determine the number (or proportion) of missing (or non-missing)
###   items for each respondent
### Aliases: missTally

### ** Examples

set.seed(8675309)
#  Make data frame with 10 respondents, 10 items, and approx 30% missing data
(myItems <- makeFakeData(n = 10, nitems = 10, propmiss = .30))
#  The default is to return "pmiss", the proportion missing for each row.
missTally(myItems)
missTally(myItems, "pvalid")
missTally(myItems, "nmiss")
missTally(myItems, "nvalid")



