library(sitmo)


### Name: sitmo_parallel
### Title: Test Generation using sitmo and C++11
### Aliases: sitmo_parallel

### ** Examples

a = sitmo_parallel(10, c(1))

b = sitmo_parallel(10, c(1,2))

c = sitmo_parallel(10, c(1,2))

# True on only OS X or systems without openmp
isTRUE(all.equal(a,b))

isTRUE(all.equal(b,c))



