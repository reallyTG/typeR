library(bnlearn)


### Name: ci.test
### Title: Independence and conditional independence tests
### Aliases: ci.test
### Keywords: independence tests

### ** Examples

data(gaussian.test)
data(learning.test)

# using a data frame and column labels.
ci.test(x = "F" , y = "B", z = c("C", "D"), data = gaussian.test)
# using a data frame.
ci.test(gaussian.test)
# using factor objects.
attach(learning.test)
ci.test(x = F , y = B, z = data.frame(C, D))



