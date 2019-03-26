library(lessR)


### Name: factors
### Title: Create Factor Variables Across a Sequential Range or Vector of
###   Variables
### Aliases: factors doFactors

### ** Examples

# get the data, variables Gender plus m01 through m20, 20 Mach IV items
# coded as integers from 0 to 5 on 6-pt Likert scales
d <- rd("Mach4", in.lessR=TRUE, quiet=TRUE)

# single variable converted to a factor
d <- factors(Gender, 0:1, c("Male", "Female"))

# Define the labels
LikertCats <- c("Strongly Disagree", "Disagree", "Slightly Disagree",
                "Slightly Agree", "Agree", "Strongly Agree")

# Convert the integer responses to factors for the 20 Mach IV items
d <- factors(m01:m20, levels=0:5, labels=LikertCats)

# read the data again and this time also the variable labels
d <- rd("Mach4", in.lessR=TRUE, quiet=TRUE)
mylabels <- rd("dataMach4_lbl", in.lessR=TRUE)

# convert specified variables to factors according to the given vector
#   of three variables only
# leave the original variables unmodified, create new variables
d <- factors(c(m06, m07, m20), levels=0:5, labels=LikertCats, new=TRUE)
# now copy the variable labels from the original integer variables to the 
#   newly created factor variables
mylabels <- factors(c(m06, m07, m20), var.labels=TRUE)



