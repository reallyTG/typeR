library(BMT)


### Name: BMTkurtosis
### Title: The BMT Distribution Descriptive Measures - Kurtosis.
### Aliases: BMTkurtosis BMTkurt BMTsteep

### ** Examples

# BMT on [0,1] with left tail weight equal to 0.25 and 
# right tail weight equal to 0.75
BMTkurt(0.25, 0.75, "t w")
BMTsteep(0.25, 0.75, "t w")

# BMT on [0,1] with asymmetry coefficient equal to 0.5 and 
# steepness coefficient equal to 0.75
BMTkurt(0.5, 0.5, "a-s")
BMTsteep(0.5, 0.5, "a-s")

# domain or location-scale parameters do not affect 
# the skewness and the asymmetry coefficient

# BMT on [-1.783489,3.312195] with 
# left tail weight equal to 0.25 and 
# right tail weight equal to 0.75
BMTkurt(0.25, 0.75, "t w", -1.783489, 3.312195, "c-d")
BMTsteep(0.25, 0.75, "t w", -1.783489, 3.312195, "c-d")

# BMT with mean equal to 0, standard deviation equal to 1, 
# asymmetry coefficient equal to 0.5 and 
# steepness coefficient equal to 0.75
BMTkurt(0.5, 0.5, "a-s", 0, 1, "l-s")
BMTsteep(0.5, 0.5, "a-s", 0, 1, "l-s")



