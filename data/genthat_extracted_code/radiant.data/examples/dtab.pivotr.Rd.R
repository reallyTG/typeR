library(radiant.data)


### Name: dtab.pivotr
### Title: Make an interactive pivot table
### Aliases: dtab.pivotr

### ** Examples

## Not run: 
##D pivotr(diamonds, cvars = "cut") %>% dtab()
##D pivotr(diamonds, cvars = c("cut","clarity")) %>% dtab(format = "color_bar")
##D pivotr(diamonds, cvars = c("cut","clarity"), normalize = "total") %>%
##D   dtab(format = "color_bar", perc = TRUE)
## End(Not run)




