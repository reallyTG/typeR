library(pixiedust)


### Name: medley
### Title: Sprinkle Medleys
### Aliases: medley medley_bw medley_model

### ** Examples

## Not run: 
##D fit <- lm(mpg ~ qsec + factor(am) + wt * factor(gear), data = mtcars)
##D 
##D dust(fit) %>%
##D   medley_bw() %>%
##D   sprinkle_print_method("html")
##D   
##D dust(fit, glance_foot = TRUE) %>%
##D   medley_model() %>%
##D   sprinkle_print_method("html")
##D   
##D # Medleys are not generics and do not have methods.
##D # Using a medley on a dust_list object requires pixieply
##D 
##D library(dplyr)
##D mtcars %>% 
##D   group_by(gear) %>% 
##D   dust(ungroup = FALSE) %>% 
##D   pixieply(medley_bw) %>% 
##D   sprinkle_print_method("html")
## End(Not run)




