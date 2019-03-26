library(naniar)


### Name: replace_with_na_at
### Title: Replace specified variables with NA where a certain condition is
###   met
### Aliases: replace_with_na_at

### ** Examples


dat_ms <- tibble::tribble(~x,  ~y,    ~z,
                          1,   "A",   -100,
                          3,   "N/A", -99,
                          NA,  NA,    -98,
                          -99, "E",   -101,
                          -98, "F",   -1)

dat_ms

replace_with_na_at(data = dat_ms,
                 .vars = "x",
                 condition = ~.x == -99)

replace_with_na_at(data = dat_ms,
                 .vars = c("x","z"),
                 condition = ~.x == -99)

# replace using values in common_na_strings
replace_with_na_at(data = dat_ms,
                 .vars = c("x","z"),
                 condition = ~.x %in% common_na_strings)





