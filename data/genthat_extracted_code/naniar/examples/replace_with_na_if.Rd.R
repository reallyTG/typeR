library(naniar)


### Name: replace_with_na_if
### Title: Replace values with NA based on some condition, for variables
###   that meet some predicate
### Aliases: replace_with_na_if

### ** Examples


dat_ms <- tibble::tribble(~x,  ~y,    ~z,
                          1,   "A",   -100,
                          3,   "N/A", -99,
                          NA,  NA,    -98,
                          -99, "E",   -101,
                          -98, "F",   -1)

dat_ms

replace_with_na_if(data = dat_ms,
                 .predicate = is.character,
                 condition = ~.x == "N/A")
replace_with_na_if(data = dat_ms,
                   .predicate = is.character,
                   condition = ~.x %in% common_na_strings)

replace_with_na(dat_ms,
              to_na = list(x = c(-99, -98),
                           y = c("N/A"),
                           z = c(-101)))





