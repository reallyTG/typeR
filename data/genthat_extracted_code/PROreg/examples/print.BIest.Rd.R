library(PROreg)


### Name: print.BIest
### Title: Print a BIest class model.
### Aliases: print.BIest

### ** Examples

set.seed(9)
# Simulate a binomial distribution
y <- rBI(100,10,0.5)

# Apply the model
model <- BIest(y,10)
print(model)   # or just model




