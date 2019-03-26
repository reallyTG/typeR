library(rmetalog)


### Name: metalog
### Title: Fit the metalog distribution to data
### Aliases: metalog

### ** Examples

# Load example data
data("fishSize")

# Create a bounded metalog object
myMetalog <- metalog(fishSize$FishSize,
                     bounds=c(0, 60),
                     boundedness = 'b',
                     term_limit = 13)



