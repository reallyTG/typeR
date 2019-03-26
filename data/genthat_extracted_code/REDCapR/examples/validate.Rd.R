library(REDCapR)


### Name: validate
### Title: Inspect a 'base::data.frame()' to anticipate problems before
###   writing to a REDCap project.
### Aliases: validate validate_no_logical validate_for_write
###   validate_field_names

### ** Examples

d <- data.frame(
  record_id      = 1:4,
  flag_logical   = c(TRUE, TRUE, FALSE, TRUE),
  flag_Uppercase = c(4, 6, 8, 2)
)
validate_for_write(d = d)



