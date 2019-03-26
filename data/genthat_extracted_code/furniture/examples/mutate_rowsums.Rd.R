library(furniture)


### Name: mutate_rowsums
### Title: Get Row Sums within a Pipe
### Aliases: mutate_rowsums

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
##D   mutate_rowsums("y_z_sums", y, z))
##D data2 <- data %>%
##D   mutate_rowsums("y_z_sums", y, z, na.rm=TRUE))
##D 
## End(Not run)




