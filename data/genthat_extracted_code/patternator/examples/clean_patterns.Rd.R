library(patternator)


### Name: clean_patterns
### Title: Automatically recognize, clean and label the pixels of a dorsal
###   pattern image traced from ImageJ
### Aliases: clean_patterns

### ** Examples

# load the sample dorsal pattern image
data(anole)

# plot of the pattern shows it contains the reference pixel
plot(anole$x, anole$y)

# remove the reference pixel, possible outliers and ambiguities
cleaned <- clean_patterns(anole)

# check the plot again
plot(cleaned$x, cleaned$y)




