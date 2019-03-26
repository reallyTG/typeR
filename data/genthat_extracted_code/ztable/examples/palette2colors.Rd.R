library(ztable)


### Name: palette2colors
### Title: Extract hexadecimal colors from a color palette
### Aliases: palette2colors

### ** Examples

require(RColorBrewer)
require(magrittr)
palette2colors("Reds")
ztable(head(mtcars,10)) %>%
     addColColor(cols=1:12,bg=palette2colors("Set3"))



