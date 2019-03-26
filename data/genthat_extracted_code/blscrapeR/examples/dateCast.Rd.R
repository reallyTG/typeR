library(blscrapeR)


### Name: dateCast
### Title: Cast a date column to data frame returned by the bls_api()
###   function
### Aliases: dateCast

### ** Examples


## Cast a date column to data frame returned by the bls_api() function.
df <- bls_api("LAUCN040010000000005") %>%
dateCast()





