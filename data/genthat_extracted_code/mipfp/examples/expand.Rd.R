library(mipfp)


### Name: expand
### Title: Expand a Table in a Data Frame
### Aliases: expand expand.default expand.table
### Keywords: manip datagen multivariate

### ** Examples

# loading data
data(spnamur, package = "mipfp")
# subsetting the data frame, keeping only the first 3 variables
spnamur.sub <- subset(spnamur, select = Household.type:Prof.status)
# create a contingency table
t <- table(spnamur.sub)
# expand the table to a data frame
t.df <- expand(t)



