library(naniar)


### Name: where
### Title: Split a call into two components with a useful verb name
### Aliases: where .where

### ** Examples


## Not run: 
##D df <- tibble::tribble(
##D ~wind, ~temp,
##D -99,    45,
##D 68,    NA,
##D 72,    25
##D )
##D 
##D dfs <- bind_shadow(df)
##D 
##D recode_shadow(dfs,
##D               temp = .where(wind == -99 ~ "bananas"))
##D 
## End(Not run)




