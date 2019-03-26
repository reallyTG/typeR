library(furrr)


### Name: future_imap
### Title: Apply a function to each element of a vector, and its index via
###   futures
### Aliases: future_imap future_imap_chr future_imap_dbl future_imap_int
###   future_imap_lgl future_imap_dfr future_imap_dfc

### ** Examples


library(furrr)
## No test: 
plan(multiprocess)
## End(No test)

future_imap_chr(sample(10), ~ paste0(.y, ": ", .x))




