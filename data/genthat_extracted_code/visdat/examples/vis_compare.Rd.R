library(visdat)


### Name: vis_compare
### Title: Visually compare two dataframes and see where they are
###   different.
### Aliases: vis_compare

### ** Examples


# make a new dataset of iris that contains some NA values
aq_diff <- airquality
aq_diff[1:10, 1:2] <- NA
vis_compare(airquality, aq_diff)



