library(dataPreparation)


### Name: whichAreBijection
### Title: Identify bijections
### Aliases: whichAreBijection

### ** Examples

# First let's get a data set
data("adult")

# Now let's check which columns are equals
whichAreInDouble(adult)
# It doesn't give any result.

# Let's look of bijections
whichAreBijection(adult)
# Return education_num index because education_num and education which
# contain the same info



