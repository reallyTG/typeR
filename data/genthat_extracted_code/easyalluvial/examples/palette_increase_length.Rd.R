library(easyalluvial)


### Name: palette_increase_length
### Title: increases length of palette by repeating colours
### Aliases: palette_increase_length

### ** Examples


require(magrittr)

length(palette_qualitative())

palette_qualitative() %>%
  palette_increase_length(100) %>%
  length()



