library(dplyr)


### Name: copy_to
### Title: Copy a local data frame to a remote src
### Aliases: copy_to

### ** Examples

## Not run: 
##D iris2 <- dbplyr::src_memdb() %>% copy_to(iris, overwrite = TRUE)
##D iris2
## End(Not run)



