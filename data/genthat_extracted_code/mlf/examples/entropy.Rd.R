library(mlf)


### Name: entropy
### Title: Entropy
### Aliases: entropy

### ** Examples

# Sample numeric vector
a <- rnorm(25, 80, 35)
mlf::entropy(a, bins = 2)

# Sample discrete vector
b <- as.factor(c(1,1,1,2))
mlf::entropy(b)



