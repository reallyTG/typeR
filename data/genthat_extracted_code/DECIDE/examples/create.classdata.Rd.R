library(DECIDE)


### Name: create.classdata
### Title: Create data frames for each class
### Aliases: create.classdata

### ** Examples

# generate a dataset
data <- data.frame(seq(1:10), rep(c(1, 2, 3), length.out = 10), 
rbinom(1, n = 10, p = 0.7), c(rnorm(8, 0, 1), NA, NA))

data_clean <- prepare.data(data)

create.classdata(data_clean)



