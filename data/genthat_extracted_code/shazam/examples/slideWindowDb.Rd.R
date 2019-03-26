library(shazam)


### Name: slideWindowDb
### Title: Sliding window approach towards filtering sequences in a
###   'data.frame'
### Aliases: slideWindowDb

### ** Examples

# Use an entry in the example data for input and germline sequence
data(ExampleDb, package="alakazam")

# Apply the sliding window approach on a subset of ExampleDb
slideWindowDb(db = ExampleDb[1:10, ], mutThresh=6, windowSize=10)




