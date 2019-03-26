library(mosaic)


### Name: CIAdata
### Title: Return a dataset based on the CIA World Factbook
### Aliases: CIAdata

### ** Examples

## Not run: 
##D head(CIAdata())
##D Population <- CIAdata("pop")
##D nrow(Population)
##D head(Population)
##D 
##D PopArea <- 
##D   CIAdata(c("pop","area")) %>% 
##D   mutate(density = pop / area)
##D nrow(PopArea)
##D head(PopArea)
##D PopArea %>% 
##D   filter(!is.na(density)) %>%
##D   arrange(density) %>% 
##D   tail()
## End(Not run)



