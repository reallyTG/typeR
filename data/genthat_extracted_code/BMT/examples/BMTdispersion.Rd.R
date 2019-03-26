library(BMT)


### Name: BMTdispersion
### Title: The BMT Distribution Descriptive Measures - Dispersion.
### Aliases: BMTdispersion BMTvar BMTsd BMTiqr

### ** Examples

# BMT on [0,1] with left tail weight equal to 0.25 and 
# right tail weight equal to 0.75
BMTvar(0.25, 0.75, "t w")
BMTsd(0.25, 0.75, "t w")
BMTiqr(0.25, 0.75, "t w")

# BMT on [0,1] with asymmetry coefficient equal to 0.5 and 
# steepness coefficient equal to 0.75
BMTvar(0.5, 0.5, "a-s")
BMTsd(0.5, 0.5, "a-s")
BMTiqr(0.5, 0.5, "a-s")

# BMT on [-1.783489,3.312195] with left tail weight equal to 0.25 and 
# right tail weight equal to 0.75
BMTvar(0.25, 0.75, "t w", -1.783489, 3.312195, "c-d")
BMTsd(0.25, 0.75, "t w", -1.783489, 3.312195, "c-d")
BMTiqr(0.25, 0.75, "t w", -1.783489, 3.312195, "c-d")

# BMT with mean equal to 0, standard deviation equal to 1, 
# asymmetry coefficient equal to 0.5 and 
# steepness coefficient equal to 0.75
BMTvar(0.5, 0.5, "a-s", 0, 1, "l-s")
BMTsd(0.5, 0.5, "a-s", 0, 1, "l-s")
BMTiqr(0.5, 0.5, "a-s", 0, 1, "l-s")



