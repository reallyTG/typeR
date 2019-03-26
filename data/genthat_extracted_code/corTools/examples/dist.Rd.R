library(corTools)


### Name: dist
### Title: Distribution Generator
### Aliases: dist

### ** Examples

# Create some sample data, as a dataframe with a numeric column
col1 <- c("L1", "L2", "L4", "E6", "G1")
col2 <- c(1.42, 14.34, 6.43, 32.1, 15.8)
dat <- as.data.frame(cbind(col1, col2))
dat$col2 <- as.numeric(as.character(dat$col2))

dist(dat$col2, 0.05, 0.95)
# dat$col2 denotes the column of the data that the distribution will be based on
# 0.05 and 0.95 indicate that the function will return values that are smaller
# than 5% of the values, or greater than 95% of the values
# function will return values 1.42 and 32.10




