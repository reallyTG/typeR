library(broom)


### Name: bootstrap
### Title: Set up bootstrap replicates of a dplyr operation
### Aliases: bootstrap

### ** Examples


## Not run: 
##D library(dplyr)
##D mtcars %>% bootstrap(10) %>% do(tidy(lm(mpg ~ wt, .)))
## End(Not run)




