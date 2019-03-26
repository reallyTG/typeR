library(replyr)


### Name: replyr_mapRestrictCols
### Title: Map names of columns to known values and drop other columns.
### Aliases: replyr_mapRestrictCols

### ** Examples


# an external function with hard-coded column names
DecreaseRankColumnByOne <- function(d) {
  d$RankColumn <- d$RankColumn - 1
  d
}

# our example data, with different column names
d <- data.frame(Sepal_Length=c(5.8,5.7),
                Sepal_Width=c(4.0,4.4),
                Species='setosa',rank=c(1,2))
print(d)


# map our data to expected column names so we can use function
nmap <- c(GroupColumn='Species',
          ValueColumn='Sepal_Length',
          RankColumn='rank')
print(nmap)
dm <- replyr_mapRestrictCols(d,nmap)
print(dm)

# can now apply code that expects hard-coded names.
dm <- DecreaseRankColumnByOne(dm)

# map back to our original column names (for the columns we retained)
# Note: can only map back columns that were retained in first mapping.
replyr_mapRestrictCols(dm, nmap, reverse=TRUE)




