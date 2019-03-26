library(rtrim)


### Name: vcov.trim
### Title: Extract variance-covariance matrix from TRIM output
### Aliases: vcov.trim

### ** Examples

data(skylark)
z <- trim(count ~ site + time, data=skylark, model=3);
totals(z)
vcv1 <- vcov(z)          # Use imputed data
vcv2 <- vcov(z,"fitted") # Use fitted data



