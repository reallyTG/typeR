library(grpss)


### Name: norm_vec
### Title: Compute the norm of a vector
### Aliases: norm_vec

### ** Examples

x <- 1:10
# "L1" norm, same as norm(as.matrix(x), "1")*length(x)
norm_vec(x)

# "L2" norm
norm_vec(x, "L2")

# "Linf" norm, same as norm(as.matrix(x),"I")
norm_vec(x, "Linf")



