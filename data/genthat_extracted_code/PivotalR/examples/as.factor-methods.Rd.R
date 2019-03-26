library(PivotalR)


### Name: as.factor-methods
### Title: Convert one column of a 'db.obj' object into a categorical
###   variable
### Aliases: relevel,db.obj-method as.factor,db.obj-method
### Keywords: methods factor math

### ** Examples

## Not run: 
##D ## get help for a method
##D ## help("as.factor,db.obj-method")
##D 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## create a temporary table from the example data.frame "abalone"
##D x <- as.db.data.frame(abalone, conn.id = cid, verbose = FALSE)
##D 
##D ## set sex to be a categorical variable
##D x$sex <- as.factor(x$sex)
##D 
##D fit1 <- madlib.lm(rings ~ . - id, data = x) # linear regression
##D 
##D fit2 <- madlib.glm(rings < 10 ~ . - id, data = x, family = "binomial") # logistic regression
##D 
##D ## another temporary table
##D z <- as.db.data.frame(abalone, conn.id = cid, verbose = FALSE)
##D 
##D ## specify factor during fitting
##D fit3 <- madlib.lm(rings ~ as.factor(sex) + length + diameter, data = z)
##D 
##D ## as.factor is automatically used onto text column
##D ## so as.factor is not necessary
##D fit4 <- madlib.glm(rings < 10 ~ sex + length + diameter, data
##D = z, family = "binomial")
##D 
##D ## using relevel to change the reference level
##D x$sex <- relevel(x$sex, ref = "M")
##D madlib.lm(rings ~ . - id, data = x) # use "M" as the reference level
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



