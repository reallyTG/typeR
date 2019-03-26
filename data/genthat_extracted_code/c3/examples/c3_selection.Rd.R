library(c3)


### Name: c3_selection
### Title: Data Select
### Aliases: c3_selection

### ** Examples

data.frame(a = c(1,2,3,2), b = c(2,3,1,5)) %>%
  c3() %>%
  c3_selection(enabled = TRUE,
               multiple = TRUE)




