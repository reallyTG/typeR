library(healthcareai)


### Name: convert_date_cols
### Title: Convert character date columns to dates and times
### Aliases: convert_date_cols

### ** Examples

d <- tibble::tibble(a_DTS = c("2018-3-25", "2018-3-25"),
                    b_nums = c(2, 4),
                    c_DTS = c("03-01-2018", "03-07-2018"),
                    d_chars = c("a", "b"),
                    e_date = lubridate::mdy(c("3-25-2018", "3-25-2018")))
convert_date_cols(d)



