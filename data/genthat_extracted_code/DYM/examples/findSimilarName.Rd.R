library(DYM)


### Name: findSimilarName
### Title: Looks for approximate matches to 'x' (the first argument) within
###   'name' (the second) argument.
### Aliases: findSimilarName

### ** Examples

## No test: 
x <- "logg"
names <- DYM:::getNames(x)
# Increasing threshold increases the number of hits, upto max_n = 10
lapply(
  stats::setNames(0:4, 0:4), 
  function(i) DYM:::findSimilarName(x, names, threshold = i)
)

# Use max_n = Inf to return all hits
DYM:::findSimilarName(x, names, threshold = 3, max_n = Inf)

# Negative max_n returns all hits except the last max_n
DYM:::findSimilarName(x, names, threshold = 3, max_n = -40)

# Set ignoreCase = TRUE to get more matches that differ by letter case
DYM:::findSimilarName(x, names, ignoreCase = TRUE)
## End(No test)



