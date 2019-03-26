library(naniar)


### Name: recode_shadow
### Title: Add special missing values to the shadow matrix
### Aliases: recode_shadow

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
##D dfs
##D 
##D recode_shadow(dfs, temp = .where(wind == -99 ~ "bananas"))
##D 
##D # need to debug this
##D 
##D recode_shadow(dfs,
##D               temp = .where(wind == -99 ~ "bananas")) %>%
##D recode_shadow(wind = .where(wind == -99 ~ "apples"))
## End(Not run)




