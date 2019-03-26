library(implyr)


### Name: copy_to
### Title: Copy a (very small) local data frame to Impala
### Aliases: copy_to copy_to.src_impala

### ** Examples

library(nycflights13)
dim(airlines) # airlines data frame is very small
# [1] 16  2

## Not run: 
##D copy_to(impala, airlines, temporary = FALSE)
## End(Not run)



