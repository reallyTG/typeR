library(radiant.data)


### Name: round_df
### Title: Round doubles in a data.frame to a specified number of decimal
###   places
### Aliases: round_df

### ** Examples

data.frame(x = as.factor(c("a", "b")), y = c(1L, 2L), z = c(-0.0005, 3.1)) %>%
  round_df(dec = 2)




