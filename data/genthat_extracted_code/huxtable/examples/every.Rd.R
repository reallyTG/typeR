library(huxtable)


### Name: every
### Title: Return every n row or column numbers
### Aliases: every everywhere evens odds

### ** Examples

ht <- huxtable(a = 1:10, b = 1:10)
set_background_color(ht,
      evens, everywhere,
      "grey95")
set_background_color(ht,
      every(3), everywhere,
      "grey95")




