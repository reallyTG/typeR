library(mrfDepth)


### Name: rdepthmedian
### Title: Hyperplane of maximal regression depth
### Aliases: rdepthmedian
### Keywords: regression

### ** Examples

# Illustrate the concept of deepest regression line in the case of simple 
# linear regression. 
data("stars")
plot(stars)
result <- rdepthmedian(x = stars)
abline(result$deepest)

x <- matrix(rnorm(3000), ncol = 3) + 10
rdepthmedian(x = x)



