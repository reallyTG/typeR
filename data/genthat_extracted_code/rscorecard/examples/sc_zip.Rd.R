library(rscorecard)


### Name: sc_zip
### Title: Subset results to those within specified area around zip code.
### Aliases: sc_zip

### ** Examples

## Not run: 
##D sc_zip(37203)
##D sc_zip(37203, 50)
##D sc_zip(37203, 50, km = TRUE)
##D sc_zip('02111')              # 1. Using string
##D sc_zip(02111)                # 2. Dropped leading zero will be added
##D sc_zip(2111)                 # 3. Will become '02111' (not recommended)
## End(Not run)



