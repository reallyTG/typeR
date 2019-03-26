library(utiml)


### Name: fixed_threshold
### Title: Apply a fixed threshold in the results
### Aliases: fixed_threshold fixed_threshold.default
###   fixed_threshold.mlresult

### ** Examples

# Create a prediction matrix with scores
result <- matrix(
 data = rnorm(9, 0.5, 0.2),
 ncol = 3,
 dimnames = list(NULL, c('lbl1',  'lb2', 'lb3'))
)

# Use 0.5 as threshold
fixed_threshold(result)

# Use an threshold for each label
fixed_threshold(result, c(0.4, 0.6, 0.7))



