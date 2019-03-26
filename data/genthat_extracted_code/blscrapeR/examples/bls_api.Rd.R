library(blscrapeR)


### Name: bls_api
### Title: Basic Request Mechanism for BLS Tables
### Aliases: bls_api
### Keywords: api bls cpi economics inflation unemployment

### ** Examples



## API Version 1.0 R Script Sample Code
## Single Series request
df <- bls_api("LAUCN040010000000005")

## Not run: 
##D ## API Version 1.0 R Script Sample Code
##D ## Multiple Series request with date params.
##D df <- bls_api(c("LAUCN040010000000005", "LAUCN040010000000006"), 
##D startyear = "2010", endyear = "2012")
##D 
##D 
##D ## API Version 1.0 R Script Sample Code
##D ## Multiple Series request with date params.
##D df <- bls_api(c("LAUCN040010000000005", "LAUCN040010000000006"), 
##D startyear = "2010", endyear = "2012")
##D 
##D 
##D ## API Version 2.0 R Script Sample Code
##D ## Multiple Series request with full params allowed by v2.
##D df <- bls_api(c("LAUCN040010000000005", "LAUCN040010000000006"),
##D startyear = "2010", endyear = "2012",
##D registrationKey = "BLS_KEY", 
##D calculations = TRUE, annualaverage = TRUE, catalog = TRUE)
## End(Not run)




