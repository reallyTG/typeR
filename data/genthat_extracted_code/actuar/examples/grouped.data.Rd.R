library(actuar)


### Name: grouped.data
### Title: Grouped data
### Aliases: grouped.data
### Keywords: classes methods

### ** Examples

## Most common usage using a predetermined set of group
## boundaries and group frequencies.
cj <- c(0, 25, 50, 100, 250, 500, 1000)
nj <- c(30, 31, 57, 42, 45, 10)
(x <- grouped.data(Group = cj, Frequency = nj))
class(x)

x[, 1] # group boundaries
x[, 2] # group frequencies

## Multiple frequency columns are supported
x <- sample(1:100, 9)
y <- sample(1:100, 9)
grouped.data(cj = 1:10, nj.1 = x, nj.2 = y)

## Alternative usage with grouping of individual data.
grouped.data(x)                         # automatic breakpoints
grouped.data(x, breaks = 7)             # forced number of groups
grouped.data(x, breaks = c(0,25,75,100))    # specified groups
grouped.data(x, y, breaks = c(0,25,75,100)) # multiple data sets

## Not run: 
##D ## Providing two or more data sets and automatic breakpoints is
##D ## very error-prone since the range of the first data set has to
##D ## include the ranges of all the other data sets.
##D range(x)
##D range(y)
##D grouped.data(x, y, group = TRUE)
## End(Not run)



