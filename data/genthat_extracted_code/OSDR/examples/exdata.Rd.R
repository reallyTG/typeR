library(OSDR)


### Name: exdata
### Title: Executive dataset (subset of)
### Aliases: exdata
### Keywords: datasets, matched pair comparison, gender gap, observational
###   studies

### ** Examples

# load executive data
data(exdata)

# case study: matched samples for comparing women and men executives

table(exdata$sex)
table(exdata$position,exdata$sex)
# There are more women and more in apical position. 

# A complete matching is not possible for several choices of the caliper.
# Gap differences tend to be higher for higher ranks

# e.g. Lynn and Thompson(1997), Above the glass ceiling? A comparison of
# matched Samples of Men and Women Executives. J. of Appl. Psych. 82(3)

# so we would give higher matching priority to women in higher position.
# We can use OSDR to find a minimum cost matching 
# performing matching by decreasing hierarchical position. 

# An illustrative example is shown in the help page of the OSDR function.






