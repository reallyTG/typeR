library(ruler)


### Name: assert_any_breaker
### Title: Assert presence of rule breaker
### Aliases: assert_any_breaker

### ** Examples

## Not run: 
##D   mtcars %>%
##D     expose(data_packs(. %>% dplyr::summarise(nrow_low = nrow(.) > 50))) %>%
##D     assert_any_breaker()
## End(Not run)



