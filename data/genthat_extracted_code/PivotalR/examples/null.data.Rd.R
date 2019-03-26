library(PivotalR)


### Name: null.data
### Title: A Data Set with lots of 'NA' values
### Aliases: null.data
### Keywords: database data operation

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## create a table from the example data.frame "abalone"
##D delete("null_data", conn.id = cid)
##D x <- as.db.data.frame(null.data, "null_data", conn.id = cid, verbose = FALSE)
##D 
##D ## ERROR, because of NULL values
##D fit <- madlib.lm(sf_mrtg_pct_assets ~ ris_asset + lncrcd + lnauto +
##D                  lnconoth + lnconrp + intmsrfv + lnrenr1a + lnrenr2a +
##D                  lnrenr3a, data = x)
##D 
##D ## select columns
##D y <- x[,c("sf_mrtg_pct_assets","ris_asset", "lncrcd","lnauto",
##D           "lnconoth","lnconrp","intmsrfv","lnrenr1a","lnrenr2a",
##D           "lnrenr3a")]
##D 
##D dim(y)
##D 
##D ## remove NULL values
##D for (i in 1:10) y <- y[!is.na(y[i]),]
##D 
##D dim(y)
##D 
##D fit <- madlib.lm(sf_mrtg_pct_assets ~ ., data = y)
##D 
##D fit
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



