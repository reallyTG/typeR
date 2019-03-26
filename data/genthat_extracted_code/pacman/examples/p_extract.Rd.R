library(pacman)


### Name: p_extract
### Title: Convert String With Commas Into Elements
### Aliases: p_extract

### ** Examples

## Not run: 
##D p_extract(p_info(ggplot2, "Depends"))
##D p_extract(p_info(ggplot2, "Imports"))
##D lapply(p_info(ggplot2, "Imports", "Depends", "Suggests"), p_extract)
## End(Not run)



