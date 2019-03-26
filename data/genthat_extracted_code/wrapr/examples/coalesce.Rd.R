library(wrapr)


### Name: coalesce
### Title: Coalesce values (NULL/NA on left replaced by values on the
###   right).
### Aliases: coalesce %?%

### ** Examples


c(NA, NA, NA) %?% 5            # returns c(5, 5, 5)
c(1, NA, NA) %?% list(5)       # returns c(1, 5, 5)
c(1, NA, NA) %?% list(list(5)) # returns c(1, NA, NA)
c(1, NA, NA) %?% c(NA, 20, NA) # returns c(1, 20, NA)
NULL %?% list()    # returns NULL
NULL %?% c(1, NA) # returns c(1, NA)
list(1, NULL, NULL) %?% c(3, 4, NA)                         # returns list(1, 4, NA_real_)
list(1, NULL, NULL, NA, NA) %?% list(2, NULL, NA, NULL, NA) # returns list(1, NULL, NA, NULL, NA)
c(1, NA, NA) %?% list(1, 2, list(3)) # returns c(1, 2, NA)
c(1, NA) %?% list(1, NULL)           # returns c(1, NA)
c() %?% list(1, NA, NULL)    # returns list(1, NA, NULL)
c() %?% c(1, NA, 2)          # returns c(1, NA, 2)




