library(naniar)


### Name: miss_scan_count
### Title: Search and present different kinds of missing values
### Aliases: miss_scan_count

### ** Examples


dat_ms <- tibble::tribble(~x,  ~y,    ~z,
                         1,   "A",   -100,
                         3,   "N/A", -99,
                         NA,  NA,    -98,
                         -99, "E",   -101,
                         -98, "F",   -1)

miss_scan_count(dat_ms,-99)
miss_scan_count(dat_ms,c(-99,-98))
miss_scan_count(dat_ms,c("-99","-98","N/A"))
miss_scan_count(dat_ms,common_na_strings)




