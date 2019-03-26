library(PivotalR)


### Name: predict
### Title: Generate the 'db.Rquery' object that can calculate the
###   predictions
### Aliases: predict.lm.madlib predict.logregr.madlib
###   predict.lm.madlib.grps predict.logregr.madlib.grps predict.glm.madlib
###   predict.glm.madlib.grps
### Keywords: methods math stats

### ** Examples


## Not run: 
##D 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## create db.table object pointing to a data table
##D delete("abalone", conn.id = cid)
##D x <- as.db.data.frame(abalone, "abalone", conn.id = cid, verbose = FALSE)
##D 
##D ## Example 1 --------
##D 
##D fit <- madlib.lm(rings ~ . - sex - id, data = x)
##D 
##D fit
##D 
##D pred <- predict(fit, x) # prediction
##D 
##D content(pred)
##D 
##D ans <- x$rings # the actual value
##D 
##D lk((ans - pred)^2, 10) # squared error
##D 
##D lk(mean((ans - pred)^2)) # mean squared error
##D 
##D ## Example 2 ---------
##D 
##D y <- x
##D y$sex <- as.factor(y$sex)
##D fit <- madlib.lm(rings ~ . - id, data = y)
##D 
##D lk(mean((y$rings - predict(fit, y))^2))
##D 
##D ## Example 3 ---------
##D 
##D fit <- madlib.lm(rings ~ . - id | sex, data = x)
##D 
##D fit
##D 
##D pred <- predict(fit, x)
##D 
##D content(pred)
##D 
##D ans <- x$rings
##D 
##D lk(mean((ans - pred)^2))
##D 
##D ## predictions for one group of data where sex = I
##D idx <- which(groups(fit)[["sex"]] == "I") # which sub-model
##D pred1 <- predict(fit[[idx]], x[x$sex == "I",]) # predict on part of data
##D 
##D ## Example 3 --------
##D 
##D ## plot the predicted values v.s. the true values
##D ap <- ans # true values
##D ap$pred <- pred # add a column which is the predicted values
##D 
##D ## If the data set is very big, you do not want to load all the
##D ## data points into R and plot. We can just plot a random sample.
##D random.sample <- lk(sort(ap, FALSE, NULL), 1000) # sort randomly
##D 
##D plot(random.sample)
##D 
##D ## ------------------------------------------------------------
##D ## GLM prediction
##D 
##D fit <- madlib.glm(rings ~ . - id | sex, data = x, family = poisson(log),
##D                   control = list(max.iter = 20))
##D 
##D p <- predict(f)
##D 
##D lk(p, 10)
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



