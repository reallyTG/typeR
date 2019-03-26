library(tester)


### Name: same_dim
### Title: Same Dimension
### Aliases: different_dim same_dim

### ** Examples

a = matrix(1:15, 5, 3)

same_dim(a, a) # TRUE
same_dim(a, t(a)) # FALSE

different_dim(a, a) # FALSE
different_dim(a, t(a)) # TRUE



