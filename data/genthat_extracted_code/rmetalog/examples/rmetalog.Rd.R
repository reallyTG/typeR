library(rmetalog)


### Name: rmetalog
### Title: Create random samples from an metalog distribution object
### Aliases: rmetalog rmetalog-package

### ** Examples

# Load example data
data("fishSize")

# Create a bounded metalog object
myMetalog <- metalog(fishSize$FishSize,
                     bounds=c(0, 60),
                     boundedness = 'b',
                     term_limit = 9,
                     term_lower_bound = 9)

s <- rmetalog(myMetalog, n=1000, term = 9)
hist(s)



