library(PivotalR)


### Name: PivotalR-package
### Title: An R font-end to PostgreSQL and Greenplum database, and wrapper
###   for in-database parallel and distributed machine learning open-source
###   library MADlib
### Aliases: PivotalR-package
### Keywords: package

### ** Examples

## Not run: 
##D ## get the help for the package
##D help("PivotalR-package")
##D 
##D ## get help for a function
##D help(madlib.lm)
##D 
##D ## create multiple connections to different databases
##D db.connect(port = 5433) # connection 1, use default values for the parameters
##D db.connect(dbname = "test", user = "qianh1", password = "", host =
##D "remote.machine.com", madlib = "madlib07", port = 5432) # connection 2
##D 
##D db.list() # list the info for all the connections
##D 
##D ## list all tables/views that has "ornst" in the name
##D db.objects("ornst")
##D 
##D ## list all tables/views
##D db.objects(conn.id = 1)
##D 
##D ## create a table and the R object pointing to the table
##D ## using the example data that comes with this package
##D delete("abalone", conn.id = cid)
##D x <- as.db.data.frame(abalone, "abalone")
##D 
##D ## OR if the table already exists, you can create the wrapper directly
##D ## x <- db.data.frame("abalone")
##D 
##D dim(x) # dimension of the data table
##D 
##D names(x) # column names of the data table
##D 
##D madlib.summary(x) # look at a summary for each column
##D 
##D lk(x, 20) # look at a sample of the data
##D 
##D ## look at a sample sorted by id column
##D lookat(sort(x, decreasing = FALSE, x$id), 20)
##D 
##D lookat(sort(x, FALSE, NULL), 20) # look at a sample ordered randomly
##D 
##D ## linear regression Examples --------
##D 
##D ## fit one different model to each group of data with the same sex
##D fit1 <- madlib.lm(rings ~ . - id | sex, data = x)
##D 
##D fit1 # view the result
##D 
##D lookat(mean((x$rings - predict(fit1, x))^2)) # mean square error
##D 
##D ## plot the predicted values v.s. the true values
##D ap <- x$rings # true values
##D ap$pred <- predict(fit1, x) # add a column which is the predicted values
##D 
##D ## If the data set is very big, you do not want to load all the
##D ## data points into R and plot. We can just plot a random sample.
##D random.sample <- lk(sort(ap, FALSE, "random"), 1000) # sort randomly
##D 
##D plot(random.sample) # plot a random sample
##D 
##D ## fit a single model to all data treating sex as a categorical variable ---------
##D y <- x # make a copy, y is now a db.data.frame object
##D y$sex <- as.factor(y$sex) # y becomes a db.Rquery object now
##D fit2 <- madlib.lm(rings ~ . - id, data = y)
##D 
##D fit2 # view the result
##D 
##D lookat(mean((y$rings - predict(fit2, y))^2)) # mean square error
##D 
##D ## logistic regression Examples --------
##D 
##D ## fit one different model to each group of data with the same sex
##D fit3 <- madlib.glm(rings < 10 ~ . - id | sex, data = x, family = "binomial")
##D 
##D fit3 # view the result
##D 
##D ## the percentage of correct prediction
##D lookat(mean((x$rings < 10) == predict(fit3, x)))
##D 
##D ## fit a single model to all data treating sex as a categorical variable ----------
##D y <- x # make a copy, y is now a db.data.frame object
##D y$sex <- as.factor(y$sex) # y becomes a db.Rquery object now
##D fit4 <- madlib.glm(rings < 10 ~ . - id, data = y, family = "binomial")
##D 
##D fit4 # view the result
##D 
##D ## the percentage of correct prediction
##D lookat(mean((y$rings < 10) == predict(fit4, y)))
##D 
##D ## Group by Examples --------
##D 
##D ## mean value of each column except the "id" column
##D lk(by(x[,-1], x$sex, mean))
##D 
##D ## standard deviation of each column except the "id" column
##D lookat(by(x[,-1], x$sex, sd))
##D 
##D ## Merge Examples --------
##D 
##D ## create two objects with different rows and columns
##D key(x) <- "id"
##D y <- x[1:300, 1:6]
##D z <- x[201:400, c(1,2,4,5)]
##D 
##D ## get 100 rows
##D m <- merge(y, z, by = c("id", "sex"))
##D 
##D lookat(m, 20)
##D 
##D ## operator Examples --------
##D 
##D y <- x$length + x$height + 2.3
##D z <- x$length * x$height / 3
##D 
##D lk(y < z, 20)
##D 
##D ## ------------------------------------------------------------------------
##D ## Deal with NULL values
##D 
##D delete("null_data")
##D x <- as.db.data.frame(null.data, "null_data")
##D 
##D ## OR if the table already exists, you can create the wrapper directly
##D ## x <- db.data.frame("null_data")
##D 
##D dim(x)
##D 
##D names(x)
##D 
##D ## ERROR, because of NULL values
##D fit <- madlib.lm(sf_mrtg_pct_assets ~ ., data = x)
##D 
##D ## remove NULL values
##D y <- x # make a copy
##D for (i in 1:10) y <- y[!is.na(y[i]),]
##D 
##D dim(y)
##D 
##D fit <- madlib.lm(sf_mrtg_pct_assets ~ ., data = y)
##D 
##D fit
##D 
##D ## Or we can replace all NULL values
##D x[is.na(x)] <- 45
## End(Not run)



