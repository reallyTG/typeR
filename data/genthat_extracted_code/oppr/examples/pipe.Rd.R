library(oppr)


### Name: %>%
### Title: Pipe operator
### Aliases: %>% pipe

### ** Examples

# set seed for reproducibility
set.seed(500)

# generate 100 random numbers and calculate the mean
mean(runif(100))

# reset the seed
set.seed(500)

# repeat the previous procedure but use the pipe operator instead of nesting
# function calls inside each other.
runif(100) %>% mean()




