library(furniture)


### Name: mutate_rowmeans
### Title: Get Row Means within a Pipe
### Aliases: mutate_rowmeans

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
##D   mutate_rowmeans("y_z_mean", y, z))
##D data2 <- data %>%
##D   mutate_rowmeans("y_z_mean", y, z, na.rm=TRUE))
##D 
## End(Not run)




