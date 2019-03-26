library(naniar)


### Name: replace_with_na
### Title: Replace values with missings
### Aliases: replace_with_na

### ** Examples


dat_ms <- tibble::tribble(~x,  ~y,    ~z,
                         1,   "A",   -100,
                         3,   "N/A", -99,
                         NA,  NA,    -98,
                         -99, "E",   -101,
                         -98, "F",   -1)

replace_with_na(dat_ms,
               replace = list(x = -99))

replace_with_na(dat_ms,
             replace = list(x = -98))

replace_with_na(dat_ms,
             replace = list(x = c(-99, -98)))

replace_with_na(dat_ms,
             replace = list(x = c(-99, -98),
                          y = c("N/A")))

replace_with_na(dat_ms,
             replace = list(x = c(-99, -98),
                          y = c("N/A"),
                          z = c(-101)))



