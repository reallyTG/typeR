library(fastDummies)


### Name: dummy_columns
### Title: Fast creation of dummy variables
### Aliases: dummy_columns

### ** Examples

crime <- data.frame(city = c("SF", "SF", "NYC"),
    year = c(1990, 2000, 1990),
    crime = 1:3)
dummy_cols(crime)
# Include year column
dummy_cols(crime, select_columns = c("city", "year"))
# Remove first dummy for each pair of dummy columns made
dummy_cols(crime, select_columns = c("city", "year"),
    remove_first_dummy = TRUE)



