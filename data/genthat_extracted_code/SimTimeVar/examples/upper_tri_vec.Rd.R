library(SimTimeVar)


### Name: upper_tri_vec
### Title: Turn symmetric matrix into vector
### Aliases: upper_tri_vec

### ** Examples

# make a simple correlation matrix
x = rnorm(10); y = rnorm(10); z = rnorm(10)
mat = cor( data.frame(x,y,z) )

# turn into into vector
upper_tri_vec(mat)



