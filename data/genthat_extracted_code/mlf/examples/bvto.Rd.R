library(mlf)


### Name: bvto
### Title: Bias-Variance Trade-Off
### Aliases: bvto

### ** Examples

# Sample data
test <- rnorm(25, 80, 35)
predicted <- rnorm(25, 80, 50)

mlf::bvto(test, predicted)



