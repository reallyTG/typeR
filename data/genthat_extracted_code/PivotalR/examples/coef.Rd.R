library(PivotalR)


### Name: coef
### Title: Extract model coefficients for Madlib regression objects
### Aliases: coef.logregr.madlib coef.lm.madlib coef.logregr.madlib.grps
###   coef.lm.madlib.grps
### Keywords: utility

### ** Examples
 ## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## create a table
##D delete("abalone", conn.id = cid)
##D x <- as.db.data.frame(abalone, "abalone", conn.id = cid, verbose = FALSE)
##D 
##D fit <- madlib.glm(rings < 10 ~ . - id | sex, data = x, family =
##D "binomial")
##D 
##D coef(fit)
##D 
##D coef(fit[[1]])
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run) 


