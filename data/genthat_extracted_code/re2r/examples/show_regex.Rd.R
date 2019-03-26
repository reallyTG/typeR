library(re2r)


### Name: show_regex
### Title: Show regex pattern in a htmlwidget
### Aliases: show_regex

### ** Examples

# Skip on CRAN

## Not run: 
##D 
##D # US ZIP code
##D 
##D show_regex("[0-9]{5}(?:-[0-9]{4})?")
##D 
##D # Email
##D 
##D show_regex("\\b[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}\\b")
##D 
##D # Hex value
##D 
##D show_regex("#?([a-f0-9]{6}|[a-f0-9]{3})")
##D 
## End(Not run)




