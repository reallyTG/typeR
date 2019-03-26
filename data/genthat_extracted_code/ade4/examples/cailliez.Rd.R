library(ade4)


### Name: cailliez
### Title: Transformation to make Euclidean a distance matrix
### Aliases: cailliez
### Keywords: array

### ** Examples

data(capitales)
d0 <- capitales$dist
is.euclid(d0) # FALSE
d1 <- cailliez(d0, TRUE)
# Cailliez constant = 2429.87867 
is.euclid(d1) # TRUE
plot(d0, d1)
abline(lm(unclass(d1)~unclass(d0)))
print(coefficients(lm(unclass(d1)~unclass(d0))), dig = 8) # d1 = d + Cte
is.euclid(d0 + 2428) # FALSE
is.euclid(d0 + 2430) # TRUE the smallest constant



