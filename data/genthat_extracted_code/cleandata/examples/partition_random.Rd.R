library(cleandata)


### Name: partition_random
### Title: Partitioning A Dataset Randomly
### Aliases: partition_random
### Keywords: manip

### ** Examples

# refer to vignettes if you want to use log files
message('refer to vignettes if you want to use log files')

# building a data frame
A <- 2:16
B <- letters[12:26]
df <- data.frame(A, B)

# partitioning
df0 <- partition_random(df, train = 7)
df0 <- cbind(df, df0)
print(df0)
df0 <- partition_random(df, train = 7, val = 2)
df0 <- cbind(df, df0)
print(df0)



