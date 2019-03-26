library(PivotalR)


### Name: vcov
### Title: vcov methods for Madlib regression objects
### Aliases: vcov.logregr.madlib vcov.lm.madlib vcov.logregr.madlib.grps
###   vcov.lm.madlib.grps

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
##D vcov(fit)
##D 
##D vcov(fit[[1]])
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



