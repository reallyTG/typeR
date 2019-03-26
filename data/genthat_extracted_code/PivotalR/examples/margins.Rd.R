library(PivotalR)


### Name: margins
### Title: Compute the marginal effects of regression models
### Aliases: margins margins.lm.madlib margins.lm.madlib.grps
###   margins.logregr.madlib margins.logregr.madlib.grps print.margins Vars
###   Terms
### Keywords: stats math

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname)
##D 
##D ## create a data table in database and the R wrapper
##D delete("abalone", conn.id = cid)
##D dat <- as.db.data.frame(abalone, "abalone", conn.id = cid)
##D 
##D fit <- madlib.lm(rings ~ length + diameter*sex, data = dat)
##D margins(fit)
##D margins(fit, at.mean = TRUE)
##D margins(fit, factor.continuous = TRUE)
##D margins(fit, dydx = ~ Vars(model) + Terms())
##D 
##D fit <- madlib.glm(rings < 10 ~ length + diameter*sex, data = dat, family = "logistic")
##D margins(fit, ~ length + sex)
##D margins(fit, ~ length + sex.M, at.mean = TRUE)
##D margins(fit, ~ length + sex.I, factor.continuous = TRUE)
##D margins(fit, ~ Vars(model) + Terms())
##D 
##D ## create a data table that has two columns
##D ## one of them is an array column
##D dat1 <- cbind(db.array(dat[,-c(1,2,10)]), dat[,10])
##D names(dat1) <- c("x", "y")
##D delete("abalone_array", conn.id = cid)
##D dat1 <- as.db.data.frame(dat1, "abalone_array")
##D 
##D fit <- madlib.glm(y < 10 ~ x[-1], data = dat1, family = "logistic")
##D margins(fit, ~ x[2:5])
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



