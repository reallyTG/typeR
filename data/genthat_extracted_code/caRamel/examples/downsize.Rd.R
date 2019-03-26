library(caRamel)


### Name: downsize
### Title: downsize
### Aliases: downsize

### ** Examples

# Definition of the parameters
points <- matrix(rexp(200), 100, 2)
prec <- c(1.e-3, 1.e-3)
Fo <- sample(1:100, 100)
# Call the function
res <- downsize(points, Fo, prec)




