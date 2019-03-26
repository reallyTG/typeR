library(modelr)


### Name: resample
### Title: A "lazy" resample.
### Aliases: resample

### ** Examples

resample(mtcars, 1:10)

b <- resample_bootstrap(mtcars)
b
as.integer(b)
as.data.frame(b)

# Many modelling functions will do the coercion for you, so you can
# use a resample object directly in the data argument
lm(mpg ~ wt, data = b)



