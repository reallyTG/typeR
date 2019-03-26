library(easyalluvial)


### Name: alluvial_wide
### Title: alluvial plot of data in wide format
### Aliases: alluvial_wide

### ** Examples


require(magrittr)
require(dplyr)

data = as_tibble(mtcars)
categoricals = c('cyl', 'vs', 'am', 'gear', 'carb')
numericals = c('mpg', 'cyl', 'disp', 'hp', 'drat', 'wt', 'qsec')
max_variables = 5

data = data %>%
  mutate_at( vars(categoricals), as.factor )


alluvial_wide( data = data
                , max_variables = max_variables
                , fill_by = 'first_variable' )
## Not run: 
##D 
##D # more coloring variants----------------------
##D alluvial_wide( data = data
##D                 , max_variables = max_variables
##D                 , fill_by = 'last_variable' )
##D 
##D alluvial_wide( data = data
##D                 , max_variables = max_variables
##D                 , fill_by = 'all_flows' )
##D 
##D alluvial_wide( data = data
##D                 , max_variables = max_variables
##D                 , fill_by = 'first_variable' )
##D 
##D # manually order variable values---------------
##D 
##D alluvial_wide( data = data
##D                  , max_variables = max_variables
##D                  , fill_by = 'values'
##D                  , order_levels = c('1', '0') )
## End(Not run)



