library(birk)


### Name: conv_unit
### Title: Convert Units of Measurement
### Aliases: conv_unit

### ** Examples

conv_unit(2.54, "cm", "inch") # Result = 1 inch

conv_unit(seq(1, 10), "kg", "short_ton") # A vector of measurement values can be converted

# Convert 1, 10, and 100 meters to all other length units
sapply(conv_unit_options$length, function(x) conv_unit(c(1, 10, 100), "m", x))

conv_unit("33 1 1", "deg_min_sec", "dec_deg")

conv_unit(c("101 44.32","3 19.453"), "deg_dec_min", "deg_min_sec")




