library(replyr)


### Name: replyr_apply_f_mapped
### Title: Apply a function to a re-mapped data frame.
### Aliases: replyr_apply_f_mapped

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

dF <- replyr_apply_f_mapped(d, DecreaseRankColumnByOne, nmap)
print(dF)






