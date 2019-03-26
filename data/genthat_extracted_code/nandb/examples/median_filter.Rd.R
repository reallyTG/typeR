library(nandb)


### Name: median_filter
### Title: Smooth and median filters with options for handling NAs.
### Aliases: median_filter smooth_filter

### ** Examples

m <- matrix(1:9, nrow = 3)
m[2:3, 2:3] <- NA
print(m)
median_filter(m)
median_filter(m, na_rm = TRUE)
median_filter(m, na_count = TRUE)

smooth_filter(m)
smooth_filter(m, na_rm = TRUE)
smooth_filter(m, na_count = TRUE)




