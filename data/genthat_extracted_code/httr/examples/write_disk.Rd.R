library(httr)


### Name: write_disk
### Title: Control where the response body is written.
### Aliases: write_disk write_memory

### ** Examples

tmp <- tempfile()
r1 <- GET("https://www.google.com", write_disk(tmp))
readLines(tmp)

# The default
r2 <- GET("https://www.google.com", write_memory())

# Save a very large file
## Not run: 
##D GET(
##D   "http://www2.census.gov/acs2011_5yr/pums/csv_pus.zip",
##D   write_disk("csv_pus.zip"), progress()
##D )
## End(Not run)



