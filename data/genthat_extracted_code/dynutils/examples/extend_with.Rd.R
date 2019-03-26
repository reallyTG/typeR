library(dynutils)


### Name: extend_with
### Title: Extend an object
### Aliases: extend_with

### ** Examples

library(purrr)
l <- list(important_number = 42) %>% add_class("my_list")
l %>% extend_with(
  .class_name = "improved_list",
  url = "https://github.com/dynverse/dynverse"
)
l



