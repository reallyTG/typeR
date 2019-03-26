library(tsibble)


### Name: key_by
### Title: Change key variables for a given 'tbl_ts'
### Aliases: key_by

### ** Examples

# By removing `State` from key, it is a valid tsibble too.
tourism %>%
  key_by(Region, Purpose)



