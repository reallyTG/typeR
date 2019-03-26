library(recommenderlab)


### Name: MSWeb
### Title: Anonymous web data from www.microsoft.com
### Aliases: MSWeb
### Keywords: datasets

### ** Examples

data(MSWeb)
MSWeb

nratings(MSWeb)

## look at first two users
as(MSWeb[1:2,], "list")

## items per user
hist(rowCounts(MSWeb), main="Distribution of Vroots visited per user")



