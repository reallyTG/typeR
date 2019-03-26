library(HRQoL)


### Name: summary.BBest
### Title: Summarizes a BBest class model.
### Aliases: summary.BBest

### ** Examples

set.seed(9)
# Simulate a binomial distribution
y <- rBB(100,10,0.5,2)

# Apply the model
model <- BBest(y,10)
sum.model <- summary(model)



