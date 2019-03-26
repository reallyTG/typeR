library(ryouready)


### Name: count_na
### Title: Count the number of NAs in each row or in each column
### Aliases: count_na

### ** Examples

x <- d.ngo

# count NAs row-wise across all variables
count_na(x)

# count NAs column-wise
count_na(x, along=2)



