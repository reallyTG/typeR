library(naniar)


### Name: shadow_expand_relevel
### Title: Expand and relevel a shadow column with a new suffix
### Aliases: shadow_expand_relevel

### ** Examples

## Not run: 
##D df <- tibble::tribble(
##D   ~wind, ~temp,
##D   -99,    45,
##D   68,    NA,
##D   72,    25
##D )
##D 
##D dfs <- bind_shadow(df)
##D 
##D test_shade <- dfs$wind_NA
##D 
##D shadow_expand_relevel(test_shade, "weee")
##D 
##D dfs %>%
##D   mutate(temp_NA = shadow_expand_relevel(temp_NA, "weee"))
##D 
##D 
##D # test that this breaks
##D shadow_expand_relevel(airquality, "weee")
## End(Not run)



