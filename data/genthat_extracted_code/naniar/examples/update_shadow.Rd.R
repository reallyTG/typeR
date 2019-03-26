library(naniar)


### Name: update_shadow
### Title: Expand all shadow levels
### Aliases: update_shadow

### ** Examples

 ## Not run: 
##D df <- tibble::tribble(
##D ~wind, ~temp,
##D -99,    45,
##D 68,    NA,
##D 72,    25
##D )
##D 
##D 
##D dfs <- bind_shadow(df)
##D 
##D update_shadow(dfs, "weee")
##D update_shadow(dfs, "weee") %>% what_levels()
## End(Not run)




