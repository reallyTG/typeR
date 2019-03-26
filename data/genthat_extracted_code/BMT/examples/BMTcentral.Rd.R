library(BMT)


### Name: BMTcentral
### Title: The BMT Distribution Descriptive Measures - Central Tendency.
### Aliases: BMTcentral BMTmean BMTmedian BMTmode

### ** Examples

# BMT on [0,1] with left tail weight equal to 0.25 and 
# right tail weight equal to 0.75
BMTmean(0.25, 0.75, "t w")
BMTmedian(0.25, 0.75, "t w")
BMTmode(0.25, 0.75, "t w")

# BMT on [0,1] with asymmetry coefficient equal to 0.5 and 
# steepness coefficient equal to 0.75
BMTmean(0.5, 0.5, "a-s")
BMTmedian(0.5, 0.5, "a-s")
BMTmode(0.5, 0.5, "a-s")

# BMT on [-1.783489,3.312195] with 
# left tail weight equal to 0.25 and 
# right tail weight equal to 0.75
BMTmean(0.25, 0.75, "t w", -1.783489, 3.312195, "c-d")
BMTmedian(0.25, 0.75, "t w", -1.783489, 3.312195, "c-d")
BMTmode(0.25, 0.75, "t w", -1.783489, 3.312195, "c-d")

# BMT with mean equal to 0, standard deviation equal to 1, 
# asymmetry coefficient equal to 0.5 and 
# steepness coefficient equal to 0.75
BMTmean(0.5, 0.5, "a-s", 0, 1, "l-s")
BMTmedian(0.5, 0.5, "a-s", 0, 1, "l-s")
BMTmode(0.5, 0.5, "a-s", 0, 1, "l-s")



