library(adamethods)


### Name: do_clean
### Title: Cleaning outliers
### Aliases: do_clean

### ** Examples

data(mtcars)
data <- mtcars
num_pts <- ncol(data)
do_clean(t(data), num_pts, 1.5, 80)




