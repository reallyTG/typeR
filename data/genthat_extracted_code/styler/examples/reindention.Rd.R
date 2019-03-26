library(styler)


### Name: reindention
### Title: Specify what is re-indented how
### Aliases: reindention specify_reindention tidyverse_reindention

### ** Examples

style_text("a <- xyz", reindention = specify_reindention(
  regex_pattern = "xyz", indention = 4, comments_only = FALSE
))
style_text("a <- xyz", reindention = tidyverse_reindention())



