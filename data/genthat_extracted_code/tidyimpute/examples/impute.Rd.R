library(tidyimpute)


### Name: impute
### Title: Replace missing values in tables and lists
### Aliases: impute impute_at impute_all impute_if

### ** Examples


  data(nacars)
  
## Not run: 
##D   nacars %>% impute(0, mpg, cyl)
##D   nacars %>% impute(1:6, mpg, cyl)
##D 
##D   nacars %>% impute( na.mean )
##D   nacars %>% impute( mean )       # unsafe
##D   nacars %>% impute( length, mpg, disp )
##D   nacars %>% impute( mean, mpg, disp )
##D   nacars %>% impute( mpg=na.mean, cyl=na.max )
##D   nacars %>% impute( na.mean, c('mpg','disp') )
## End(Not run)

## Not run: 
##D   nacars %>% impute_at( -99, .vars=1:3 )
##D   nacars %>% impute_at( .na=na.mean, .vars=1:6 )
##D   
##D   # Same, uses `...` for additional args
##D   nacars %>%   
##D     impute_at( .na=mean   , .vars=1:6, na.rm = TRUE  )  
##D   
##D   nacars %>% impute_at( .na=na.mean, .vars = c('mpg','cyl', 'disp') )
## End(Not run)  


## Not run: 
##D   nacars %>% impute_all( -99 )
##D   nacars %>% impute_all( na.min )
## End(Not run)
   



