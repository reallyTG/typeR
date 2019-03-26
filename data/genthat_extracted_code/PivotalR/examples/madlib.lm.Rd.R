library(PivotalR)


### Name: madlib.lm
### Title: Linear regression with grouping support, heteroskedasticity
### Aliases: madlib.lm
### Keywords: madlib stats

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D x <- as.db.data.frame(abalone, conn.id = cid, verbose = FALSE)
##D lk(x, 10)
##D 
##D ## linear regression conditioned on nation value
##D ## i.e. grouping
##D fit <- madlib.lm(rings ~ . - id | sex, data = x, heteroskedasticity = T)
##D fit
##D 
##D ## use I(.) for expressions
##D fit <- madlib.lm(rings ~ length + diameter + shell + I(diameter^2),
##D data = x, heteroskedasticity = T)
##D fit # display the result
##D 
##D ## Another example
##D fit <- madlib.lm(rings ~ . - id | sex + (id < 2000), data = x)
##D 
##D ## 3rd example
##D ## The table has two columns: x is an array, y is double precision
##D dat <- x
##D dat$arr <- db.array(x[,-c(1,2)])
##D array.data <- as.db.data.frame(dat)
##D 
##D ## Fit to y using every element of x
##D ## This does not work in R's lm, but works in madlib.lm
##D fit <- madlib.lm(rings ~ arr, data = array.data)
##D 
##D fit <- madlib.lm(rings ~ arr - arr[1], data = array.data)
##D 
##D fit <- madlib.lm(rings ~ . - arr[1:2], data = array.data)
##D 
##D fit <- madlib.lm(as.integer(rings < 10) ~ . - arr[1:2], data = array.data)
##D 
##D ## 4th example
##D ## Step-wise feature selection
##D start <- madlib.lm(rings ~ . - id - sex, data = x)
##D ## step(start)
##D 
##D db.disconnect(cid)
## End(Not run)



