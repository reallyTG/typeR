library(PivotalR)


### Name: groups
### Title: Summary information for Logistic Regression output
### Aliases: groups groups.lm.madlib groups.logregr.madlib
###   groups.lm.madlib.grps groups.logregr.madlib.grps
### Keywords: madlib math stats

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## create a table from the example data.frame
##D delete("abalone", conn.id = cid)
##D source_data <- as.db.data.frame(abalone, "abalone", conn.id = cid, verbose = FALSE)
##D lk(source_data, 10)
##D 
##D ## logistic regression
##D fit <- madlib.glm(rings < 10 ~ . - id | sex , data = source_data, family = "binomial")
##D 
##D groups(fit) # all grouping column values
##D 
##D groups(fit[[1]]) # the first model's grouping column value
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



