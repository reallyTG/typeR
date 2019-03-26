library(DECIDE)


### Name: print_relimp
### Title: Print tables of estimates
### Aliases: print_relimp

### ** Examples

# generate a dataset
set.seed(1)
data <- data.frame(seq(1:10), rep(c(1, 2, 3), length.out = 10),
	rbinom(1, n = 10, p = 0.7), c(rnorm(8, 0, 1), NA, NA))

# run function
print_relimp(data)



