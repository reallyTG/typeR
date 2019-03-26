library(wand)


### Name: magic_wand_file
### Title: Use the "magic" file that comes with the package
### Aliases: magic_wand_file

### ** Examples

library(dplyr)

system.file("extdata/img", package="wand") %>%
  list.files(full.names=TRUE) %>%
  incant(magic_wand_file()) %>%
  glimpse()



