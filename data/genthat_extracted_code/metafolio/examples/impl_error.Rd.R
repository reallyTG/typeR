library(metafolio)


### Name: impl_error
### Title: Add implementation error
### Aliases: impl_error

### ** Examples

y <- sapply(1:200, function(x) impl_error(0.5, 0.2))
hist(y)

y <- sapply(1:200, function(x) impl_error(0.3, 0.1))
hist(y)



