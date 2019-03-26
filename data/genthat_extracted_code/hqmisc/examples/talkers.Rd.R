library(hqmisc)


### Name: talkers
### Title: Data set of talkers of Dutch from the Netherlands.
### Aliases: talkers
### Keywords: datasets

### ** Examples

data(talkers)
str(talkers)
pairs( talkers[,2:6] )
with( talkers, table( sex, region, I(age>41) ) )



