library(simEd)


### Name: sample
### Title: Random Samples
### Aliases: sample
### Keywords: IO, distribution

### ** Examples

set.seed(8675309)

# use base::sample (since stream is NULL) to generate a permutation of 1:5
sample(5)

# use vunif(1, stream = 1) to generate a permutation of 1:5
sample(5, stream = 1)

# generate a (boring) sample of identical values drawn using the single value 867.5309
sample(867.5309, size = 10, replace = TRUE, stream = 1)

# use vunif(1, stream = 1) to generate a size-10 sample drawn from 7:9
sample(7:9, size = 10, replace = TRUE, stream = 1)

# use vunif(1, stream = 1) to generate a size-10 sample drawn from c('x','y','z')
sample(c('x','y','z'), size = 10, replace = TRUE, stream = 1)

# use vunif(1, stream = 1) to generate a size-5 sample drawn from a list
mylist <- list()
mylist$a <- 1:5
mylist$b <- 2:6
mylist$c <- 3:7
sample(mylist, size = 5, replace = TRUE, stream = 1)

# use vunif(1, stream = 1) to generate a size-5 sample drawn from a data frame
mydf <- data.frame(a = 1:6, b = c(1:3, 1:3))
sample(mydf, size = 5, replace = TRUE, stream = 1)



