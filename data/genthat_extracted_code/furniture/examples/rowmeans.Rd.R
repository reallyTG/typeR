library(furniture)


### Name: rowmeans
### Title: Get Row Means
### Aliases: rowmeans

### ** Examples


## Not run: 
##D 
##D library(furniture)
##D library(tidyverse)
##D 
##D data <- data.frame(
##D   x = sample(c(1,2,3,4), 100, replace=TRUE),
##D   y = rnorm(100),
##D   z = rnorm(100)
##D )
##D 
##D data2 <- data %>%
##D   mutate(y_z_mean = rowmeans(y, z))
##D data2 <- data %>%
##D   mutate(y_z_mean = rowmeans(y, z, na.rm=TRUE))
##D 
## End(Not run)




