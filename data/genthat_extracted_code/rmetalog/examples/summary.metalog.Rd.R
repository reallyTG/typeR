library(rmetalog)


### Name: summary.metalog
### Title: Summary of the metalog object
### Aliases: summary.metalog

### ** Examples

# Load example data
data("fishSize")

# Create a bounded metalog object
myMetalog <- metalog(fishSize$FishSize,
                     bounds=c(0, 60),
                     boundedness = 'b',
                     term_limit = 13)

summary(myMetalog)



