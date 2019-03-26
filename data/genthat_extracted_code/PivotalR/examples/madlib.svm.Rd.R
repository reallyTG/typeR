library(PivotalR)


### Name: madlib.svm
### Title: Support Vector Machine with regression and novelty detection
### Aliases: madlib.svm
### Keywords: madlib stats

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D data <- as.db.data.frame(abalone, conn.id = cid, verbose = FALSE)
##D lk(data, 10)
##D 
##D ## svm regression
##D ## i.e. grouping on multiple columns
##D fit <- madlib.svm(length ~ height + shell | sex + (rings > 7), data = data, type = "regression")
##D fit
##D 
##D ## use I(.) for expressions
##D fit <- madlib.svm(rings > 7 ~ height + shell + diameter + I(diameter^2),
##D                   data = data, type = "classification")
##D fit # display the result
##D 
##D ## Adding new column for training
##D dat <- data
##D dat$arr <- db.array(data[,-c(1,2)])
##D array.data <- as.db.data.frame(dat)
##D fit <- madlib.svm(rings > 7 ~ arr, data = array.data)
##D 
##D db.disconnect(cid)
## End(Not run)



