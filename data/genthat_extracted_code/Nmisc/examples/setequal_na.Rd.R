library(Nmisc)


### Name: setequal_na
### Title: Check if two vectors have the same elements
### Aliases: setequal_na

### ** Examples

setequal_na(c(2, 1, 3), c(1, 2, 3))
# returns TRUE

setequal_na(c(1, NA, 3), c(3, NA, 1), na.rm = TRUE)
# returns TRUE

setequal_na(c(NA, NA), c(NA), na.rm = TRUE)
# returns TRUE

setequal_na(c(NA, NA), c(NA))
# returns TRUE

setequal_na(c(1, 2, 3), c(1, 2, 3, NA))
# returns FALSE




