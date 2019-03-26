library(janitor)


### Name: row_to_names
### Title: Elevate a row to be the column names of a data.frame.
### Aliases: row_to_names

### ** Examples

x <- data.frame(X_1 = c(NA, "Title", 1:3),
           X_2 = c(NA, "Title2", 4:6))
x %>%
  row_to_names(row_number = 2)



