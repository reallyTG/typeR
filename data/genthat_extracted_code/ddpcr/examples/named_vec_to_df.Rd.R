library(ddpcr)


### Name: named_vec_to_df
### Title: Convert a named vector returned from vapply to a dataframe
### Aliases: named_vec_to_df
### Keywords: internal

### ** Examples

vapply(c("a", "b", "c"),
       toupper,
       character(1)) %>%
  named_vec_to_df("capital", "letter")



