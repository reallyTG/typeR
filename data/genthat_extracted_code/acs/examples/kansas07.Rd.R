library(acs)


### Name: kansas07
### Title: County-level data from the 2007 American Community Survey for
###   Kansas for use in examples of acs package.
### Aliases: kansas07
### Keywords: datasets

### ** Examples

data(kansas07)
str(kansas07)
class(kansas07)

geography(kansas07)

# subsetting
kansas07[1:3,2:4]

# row-wise addition
kansas07[1,6]+kansas07[2,6]

# column-wise addition
kansas07[1:4,3]+kansas07[1:4,27]




