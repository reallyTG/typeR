library(rsdmx)


### Name: saveSDMX
### Title: saveSDMX
### Aliases: saveSDMX

### ** Examples

## No test: 
   # Not run by 'R CMD check'
   # (reliable remote datasource but with possible occasional unavailability)

   #examples using embedded providers
   sdmx <- readSDMX(providerId = "OECD", resource = "data", flowRef = "MIG",
                     key = list("TOT", NULL, NULL), start = 2011, end = 2011)
   saveSDMX(sdmx, "sdmx.rda")
 
## End(No test)



