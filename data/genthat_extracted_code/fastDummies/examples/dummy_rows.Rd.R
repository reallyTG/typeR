library(fastDummies)


### Name: dummy_rows
### Title: Fast creation of dummy rows
### Aliases: dummy_rows

### ** Examples

crime <- data.frame(city = c("SF", "SF", "NYC"),
    year = c(1990, 2000, 1990),
    crime = 1:3)

dummy_rows(crime)
# Include year column
dummy_rows(crime, select_columns = c("city", "year"))
# m=Make dummy value 0
dummy_rows(crime, select_columns = c("city", "year"),
    dummy_value = 0)
# Add a dummy indicator
dummy_rows(crime, select_columns = c("city", "year"),
    dummy_indicator = TRUE)



