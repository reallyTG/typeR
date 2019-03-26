library(rmetalog)


### Name: plot.metalog
### Title: Plot of the metalog object
### Aliases: plot.metalog

### ** Examples

# Load example data
data("fishSize")

# Create a bounded metalog object
myMetalog <- metalog(fishSize$FishSize,
                     bounds=c(0, 60),
                     boundedness = 'b',
                     term_limit = 13)

plot(myMetalog)



