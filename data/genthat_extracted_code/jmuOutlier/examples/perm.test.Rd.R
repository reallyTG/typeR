library(jmuOutlier)


### Name: perm.test
### Title: Permutation Test
### Aliases: perm.test
### Keywords: Permutation test

### ** Examples

# One-sample test
x = rnorm(10,0.5) ;  list(x) ;  perm.test( x, stat=median )

# Two-sample unpaired test
y = rnorm(13, 1 ) ;  list(y) ;  perm.test( x, y )



