library(comperes)


### Name: widecr
### Title: Wide format of competition results
### Aliases: widecr is_widecr as_widecr as_tibble.widecr

### ** Examples

cr_data <- data.frame(
  playerA = 1:10,
  playerB = 2:11,
  scoreC = 11:20,
  scoreB = 12:21,
  otherColumn =  101:110
)
cr_data_wide <- as_widecr(cr_data, repair = TRUE)

is_widecr(cr_data_wide)

as_tibble(cr_data_wide)




