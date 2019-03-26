library(data.table)


### Name: na.omit.data.table
### Title: Remove rows with missing values on columns specified
### Aliases: na.omit.data.table na.omit
### Keywords: data

### ** Examples

DT = data.table(x=c(1,NaN,NA,3), y=c(NA_integer_, 1:3), z=c("a", NA_character_, "b", "c"))
# default behaviour
na.omit(DT)
# omit rows where 'x' has a missing value
na.omit(DT, cols="x")
# omit rows where either 'x' or 'y' have missing values
na.omit(DT, cols=c("x", "y"))

## Not run: 
##D # Timings on relatively large data
##D set.seed(1L)
##D DT = data.table(x = sample(c(1:100, NA_integer_), 5e7L, TRUE),
##D                 y = sample(c(rnorm(100), NA), 5e7L, TRUE))
##D system.time(ans1 <- na.omit(DT)) ## 2.6 seconds
##D system.time(ans2 <- stats:::na.omit.data.frame(DT)) ## 29 seconds
##D # identical? check each column separately, as ans2 will have additional attribute
##D all(sapply(1:2, function(i) identical(ans1[[i]], ans2[[i]]))) ## TRUE
## End(Not run)



