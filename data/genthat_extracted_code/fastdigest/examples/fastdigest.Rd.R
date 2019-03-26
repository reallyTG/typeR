library(fastdigest)


### Name: fastdigest
### Title: Fast, memory constant hashing of R objects
### Aliases: fastdigest

### ** Examples

x = rnorm(100)
h = fastdigest(x)
y = x
## force dup
y[100] = 1
h2 = fastdigest(y)
identical(h, h2) #FALSE
y[100] = x[100]
h3 = fastdigest(y)
identical(h, h3) # TRUE



