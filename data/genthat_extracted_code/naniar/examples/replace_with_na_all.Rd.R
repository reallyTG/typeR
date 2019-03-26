library(naniar)


### Name: replace_with_na_all
### Title: Replace all values with NA where a certain condition is met
### Aliases: replace_with_na_all

### ** Examples

dat_ms <- tibble::tribble(~x,  ~y,    ~z,
                          1,   "A",   -100,
                          3,   "N/A", -99,
                          NA,  NA,    -98,
                          -99, "E",   -101,
                          -98, "F",   -1)

dat_ms
#replace all instances of -99 with NA
replace_with_na_all(data = dat_ms,
                    condition = ~.x == -99)

# replace all instances of -98 with NA
replace_with_na_all(data = dat_ms,
                    condition = ~.x == -98)

# replace all instances of -99 or -98 with NA
replace_with_na_all(dat_ms,
                    condition = ~.x %in% c(-99, -98))

# replace all instances of -99 or -98, or "N/A" with NA
replace_with_na_all(dat_ms,
                    condition = ~.x %in% c(-99, -98, "N/A"))
# replace all instances of common na strings
replace_with_na_all(dat_ms,
                    condition = ~.x %in% common_na_strings)

# where works with functions
replace_with_na_all(airquality, ~ sqrt(.x) < 5)




