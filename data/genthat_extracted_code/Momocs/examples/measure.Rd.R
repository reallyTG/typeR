library(Momocs)


### Name: measure
### Title: Measures shape descriptors
### Aliases: measure

### ** Examples

bm <- measure(bot, coo_area, coo_perim)
bm
bm$coe

# how to use arguments, eg with the d() function
measure(wings, coo_area, d(1, 3), d(4, 5))

# alternatively, to get a data_frame
measure(bot$coo, coo_area, coo_perim)

# and also, to get a data_frame (one row)
measure(bot[1], coo_area, coo_perim)



