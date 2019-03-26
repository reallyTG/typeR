library(recipes)


### Name: check_range
### Title: Check Range Consistency
### Aliases: check_range tidy.check_range
### Keywords: datagen

### ** Examples

  slack_df <- data_frame(x = 0:100)
  slack_new_data <- data_frame(x = -10:110)

  # this will fail the check both ends
## Not run: 
##D   recipe(slack_df) %>%
##D     check_range(x) %>%
##D     prep() %>%
##D     bake(slack_new_data)
##D  
## End(Not run)

  # this will fail the check only at the upper end
## Not run: 
##D   recipe(slack_df) %>%
##D     check_range(x, slack_prop = c(0.1, 0.05)) %>%
##D     prep() %>%
##D     bake(slack_new_data)
## End(Not run)

  # give a warning instead of an error
## Not run: 
##D   recipe(slack_df) %>%
##D     check_range(x, warn = TRUE) %>%
##D     prep() %>%
##D     bake(slack_new_data)
## End(Not run)



