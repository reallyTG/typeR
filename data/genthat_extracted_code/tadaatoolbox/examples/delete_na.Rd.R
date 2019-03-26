library(tadaatoolbox)


### Name: delete_na
### Title: Delete cases with set amount of missing values
### Aliases: delete_na

### ** Examples

## Not run: 
##D df <- data.frame(x = sample(c(1:10, NA), 10),
##D                  y = sample(c(1:10, NA), 10),
##D                  z = sample(c(1:10, NA), 10))
##D 
##D df <- delete_na(df, 1)
##D 
##D # Or with magrittr syntax sugar
##D df %<>% delete_na
## End(Not run)



