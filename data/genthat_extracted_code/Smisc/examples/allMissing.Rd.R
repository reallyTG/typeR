library(Smisc)


### Name: allMissing
### Title: Identifies missing rows or columns in a data frame or matrix
### Aliases: allMissing
### Keywords: misc

### ** Examples


# Start off with a simple data frame that has a few missing values
d1 <- data.frame(x=c(3,4,NA,1,10,NA), y=c(NA,"b","c","d","e",NA))
d1

# Identify rows were the entire row is missing
allMissing(d1)

# Only removes rows where all the values are missing
d1[!allMissing(d1),]

# All missing can also be used to identify if any of the
# columns are 'all missing'
d2 <- data.frame(x=c(rnorm(3), NA, rnorm(6)), y=rep(NA,10), z=letters[1:10])
d2

# Look for columns that are all missing
allMissing(d2, byRow=FALSE)

# Remove columns where all the values are missing
d2[,!allMissing(d2, byRow = FALSE)]




