library(ldat)


### Name: elementwise
### Title: Apply a function to each element of an lvec
### Aliases: elementwise

### ** Examples

# Calculate square root of lvec
x <- as_lvec(1:10)
y <- elementwise(x, sqrt)
# of course, this is already implemented
sqrt(x)




