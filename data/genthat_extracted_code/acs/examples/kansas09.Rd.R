library(acs)


### Name: kansas09
### Title: County-level data from the 2005-2009 American Community Survey
###   for Kansas for use in examples of acs package.
### Aliases: kansas09
### Keywords: datasets

### ** Examples

data(kansas09)
str(kansas09)
class(kansas09)

geography(kansas09)

# subsetting
kansas09[1:3,2:4]

# row-wise addition
kansas09[1,6]+kansas09[2,6]

# column-wise addition
kansas09[1:4,3]+kansas09[1:4,27]




