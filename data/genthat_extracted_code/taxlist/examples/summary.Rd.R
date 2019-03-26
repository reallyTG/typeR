library(taxlist)


### Name: summary
### Title: Print Overviews for taxlist Objects and their Content
### Aliases: summary summary,taxlist-method
### Keywords: methods

### ** Examples

library(taxlist)
data(Easplist)

## summary of the object
summary(Easplist, units="Mb")

## summary for two taxa
summary(Easplist, c(51128,51140))

## summary for a name
summary(Easplist, "Acmella")

## summary for the first 10 taxa
summary(Easplist, "all", maxsum=10)



