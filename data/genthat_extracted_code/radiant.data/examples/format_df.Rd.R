library(radiant.data)


### Name: format_df
### Title: Format a data.frame with a specified number of decimal places
### Aliases: format_df

### ** Examples

data.frame(x = c("a", "b"), y = c(1L, 2L), z = c(-0.0005, 3)) %>%
  format_df(dec = 4)
data.frame(x = c(1L, 2L), y = c(0.05, 0.8)) %>%
  format_df(dec = 2, perc = TRUE)




