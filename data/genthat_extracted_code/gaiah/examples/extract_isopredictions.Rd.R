library(gaiah)


### Name: extract_isopredictions
### Title: Add the isomap prediction and sd in columns attached to the
###   feather isotope data frame
### Aliases: extract_isopredictions

### ** Examples

# Using the provided data from breeding Wilson's warblers and the provided
# predictions from isomap_job54152:
x <- extract_isopredictions(isoscape = isomap_job54152_prediction,
                       birds = breeding_wiwa_isotopes,
                       pred = "predkrig",
                       sd = "stdkrig")



