library(PROreg)


### Name: print.summary.BBest
### Title: Print a summary.BBest class model.
### Aliases: print.summary.BBest

### ** Examples

set.seed(9)
# Simulate a binomial distribution
y <- rBB(100,10,0.5,2)

# Apply the model
model <- BBest(y,10)
sum.model <- summary(model)
print(sum.model) # or just sum.model



