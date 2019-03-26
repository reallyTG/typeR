library(PivotalR)


### Name: residuals
### Title: Residuals methods for Madlib regression objects
### Aliases: residuals.logregr.madlib residuals.logregr.madlib.grps
###   residuals.lm.madlib residuals.lm.madlib.grps residuals.glm.madlib
###   residuals.glm.madlib.grps

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
##D fit <- madlib.glm(rings < 10 ~ . - id | sex, data = x, family =
##D "binomial")
##D 
##D residuals(fit)
##D 
##D db.disconnect(cid)
## End(Not run)



