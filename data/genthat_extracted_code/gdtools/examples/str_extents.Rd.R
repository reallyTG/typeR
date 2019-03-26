library(gdtools)


### Name: str_extents
### Title: Compute string extents.
### Aliases: str_extents

### ** Examples

## No test: 
# The first run can be slow when font caches are missing
# as font files are then being scanned to build those font caches.
str_extents(letters)
str_extents("Hello World!", bold = TRUE, italic = FALSE,
  fontname = "sans", fontsize = 12)
## End(No test)



