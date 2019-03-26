library(furniture)


### Name: tableX
### Title: Table X (for Cross-Tabs)
### Aliases: tableX

### ** Examples


## Not run: 
##D 
##D library(furniture)
##D library(tidyverse)
##D 
##D data <- data.frame(
##D   x = sample(c(1,2,3,4), 100, replace=TRUE),
##D   y = sample(c(0,1), 100, replace=TRUE)
##D )
##D 
##D tableX(data, x, y)
##D 
##D data %>%
##D   tableX(x, y)
##D 
##D data %>%
##D   tableX(x, y, na.rm = TRUE)
##D 
## End(Not run)




