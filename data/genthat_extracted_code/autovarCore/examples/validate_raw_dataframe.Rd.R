library(autovarCore)


### Name: validate_raw_dataframe
### Title: Validates the dataframe given to the autovar function
### Aliases: validate_raw_dataframe

### ** Examples

raw_dataframe <- data.frame(id = rep(1, times = 5),
  tijdstip = c(1, 3, 5, 6, 7),
  home = c(1, 0, 0, NA, 1))
autovarCore:::validate_raw_dataframe(raw_dataframe)



