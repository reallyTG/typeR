library(lessR)


### Name: details
### Title: Display Contents of a Data File and Optional Variable Labels
### Aliases: details db
### Keywords: read csv

### ** Examples

# read the built-in data set datEmployee
# this provides an automatic call to details
d <- Read("Employee", in.lessR=TRUE)

# manually request the details for d
details()

# manually request just variable names, labels for d
db()



