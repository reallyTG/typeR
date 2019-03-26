library(PROreg)


### Name: print.BBest
### Title: Print a BBest class model.
### Aliases: print.BBest

### ** Examples

set.seed(9)
# Simulate a binomial distribution
y <- rBB(100,10,0.5,2)

# Apply the model
model <- BBest(y,10)
print(model)   # or just model




