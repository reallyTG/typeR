library(readr)


### Name: read_rds
### Title: Read/write RDS files.
### Aliases: read_rds write_rds
### Keywords: internal

### ** Examples

temp <- tempfile()
write_rds(mtcars, temp)
read_rds(temp)

## Not run: 
##D write_rds(mtcars, "compressed_mtc.rds", "xz", compression = 9L)
## End(Not run)



