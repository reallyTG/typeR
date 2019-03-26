library(PivotalR)


### Name: AIC
### Title: AIC methods for Madlib regression objects
### Aliases: AIC.logregr.madlib extractAIC.logregr.madlib
###   logLik.logregr.madlib AIC.lm.madlib extractAIC.lm.madlib
###   logLik.lm.madlib AIC.logregr.madlib.grps
###   extractAIC.logregr.madlib.grps logLik.logregr.madlib.grps
###   AIC.lm.madlib.grps extractAIC.lm.madlib.grps logLik.lm.madlib.grps
###   AIC.glm.madlib.grps extractAIC.glm.madlib extractAIC.glm.madlib.grps
###   logLik.glm.madlib logLik.glm.madlib.grps

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
##D AIC(fit)
##D 
##D AIC(fit[[1]])
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



