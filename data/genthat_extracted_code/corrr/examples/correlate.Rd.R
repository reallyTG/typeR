library(corrr)


### Name: correlate
### Title: Correlation Data Frame
### Aliases: correlate

### ** Examples

## Not run: 
##D correlate(iris)
## End(Not run)

correlate(iris[-5])

correlate(mtcars)

## Not run: 
##D 
##D # Also supports DB backend and collects results into memory
##D 
##D library(sparklyr)
##D sc <- spark_connect(master = "local")
##D mtcars_tbl <- copy_to(sc, mtcars)
##D mtcars_cors <- mtcars_tbl %>% 
##D   correlate(use = "complete.obs")
##D mtcars_cors
##D spark_disconnect(sc)
##D 
## End(Not run)




