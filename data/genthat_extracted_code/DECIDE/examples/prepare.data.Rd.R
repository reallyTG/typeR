library(DECIDE)


### Name: prepare.data
### Title: Prepare dataset to be used in 'relative.importance'
### Aliases: prepare.data

### ** Examples

# generate a dataset
data <- data.frame(seq(1:10), rep(c(1, 2, 3), length.out = 10), 
	rbinom(1, n = 10, p = 0.7), c(rnorm(8, 0, 1), NA, NA))

# run function
data_clean <- prepare.data(data)



