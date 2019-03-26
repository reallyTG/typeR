library(wand)


### Name: incant
### Title: Retrieve 'magic' attributes from files and directories
### Aliases: incant

### ** Examples

library(dplyr)

system.file("extdata/img", package="wand") %>%
  list.files(full.names=TRUE) %>%
  incant() %>%
  glimpse()



