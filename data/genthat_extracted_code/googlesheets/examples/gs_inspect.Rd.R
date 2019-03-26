library(googlesheets)


### Name: gs_inspect
### Title: Visual overview of populated cells
### Aliases: gs_inspect

### ** Examples

## Not run: 
##D gs_inspect(iris)
##D 
##D # data recorded from a game of ultimate frisbee
##D ulti_key <- "1223dpf3vnjZUYUnCM8rBSig3JlGrAu1Qu6VmPvdEn4M"
##D ulti_ss <- ulti_key %>% gs_key()
##D ulti_dat <- ulti_ss %>% gs_read()
##D gs_inspect(ulti_dat)
##D 
##D # totally synthetic example
##D x <- suppressWarnings(matrix(0:1, 21, 21))
##D x[sample(21^2, 10)] <- NA
##D x <- as.data.frame(x)
##D some_columns <- seq(from = 1, to = 21, by = 3)
##D x[some_columns] <- lapply(x[some_columns], as.numeric)
##D gs_inspect(x)
## End(Not run)



