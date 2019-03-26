library(broom)


### Name: augment.loess
### Title: Tidy a(n) loess object
### Aliases: augment.loess loess_tidiers

### ** Examples


lo <- loess(mpg ~ wt, mtcars)
augment(lo)

# with all columns of original data
augment(lo, mtcars)

# with a new dataset
augment(lo, newdata = head(mtcars))




