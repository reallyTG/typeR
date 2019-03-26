library(ddpcr)


### Name: lol_to_df
### Title: Convert a list of lists returned from vapply to a dataframe
### Aliases: lol_to_df
### Keywords: internal

### ** Examples

vapply(c("a", "b", "c"),
       function(x) list(low = x, up = toupper(x)),
       list(character(1), character(1))) %>%
  lol_to_df("key")



