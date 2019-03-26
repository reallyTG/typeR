library(naniar)


### Name: common_na_numbers
### Title: Common number values for NA
### Aliases: common_na_numbers
### Keywords: datasets

### ** Examples


dat_ms <- tibble::tribble(~x,  ~y,    ~z,
                          1,   "A",   -100,
                          3,   "N/A", -99,
                          NA,  NA,    -98,
                          -99, "E",   -101,
                          -98, "F",   -1)

miss_scan_count(dat_ms, -99)
miss_scan_count(dat_ms, c(-99,-98))
miss_scan_count(dat_ms, c("-99","-98","N/A"))
common_na_numbers
miss_scan_count(dat_ms, common_na_numbers)



