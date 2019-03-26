library(TailRank)


### Name: TailRankTest-methods
### Title: Methods for TailRankTest objects
### Aliases: getStatistic,TailRankTest-method summary,TailRankTest-method
###   hist,TailRankTest-method as.logical,TailRankTest-method
### Keywords: manip

### ** Examples

# generate some fake data to use in the example
nr <- 40000
nc <- 110
fake.data <- matrix(rnorm(nr*nc), ncol=nc)
fake.class <- rep(c(TRUE, FALSE), c(40, 70))

# build an object
null.tr <-  TailRankTest(fake.data, fake.class)

# summarize the object
summary(null.tr)

# plot a histogram
hist(null.tr)
hist(null.tr, breaks=70, col='blue', overlay=TRUE)

# get a logical vector that can select those markers
# identified by the test
selector <- as.logical(null.tr)



