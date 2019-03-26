library(gdtools)


### Name: m_str_extents
### Title: Compute string extents for a vector of string.
### Aliases: m_str_extents

### ** Examples

## No test: 
# The first run can be slow when font caches are missing
# as font files are then being scanned to build those font caches.
m_str_extents(letters, fontsize = 1:26)
m_str_extents(letters[1:3],
  bold = c(TRUE, FALSE, TRUE),
  italic = c(FALSE, TRUE, TRUE),
  fontname = c("sans", "sans", "sans") )
## End(No test)



