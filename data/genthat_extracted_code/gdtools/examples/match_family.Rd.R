library(gdtools)


### Name: match_family
### Title: Find best family match with fontconfig
### Aliases: match_family match_font

### ** Examples

## Not run: 
##D # The first run can be slow when font caches are missing
##D # as font files are then being scanned to build those font caches.
##D match_family("sans")
##D match_family("serif", bold = FALSE, italic = TRUE)
##D 
##D match_font("Helvetica", bold = FALSE, italic = TRUE)
##D match_font("Helvetica", debug = "config")
## End(Not run)



