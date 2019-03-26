library(rmetalog)


### Name: qmetalog
### Title: Generate quantiles with a probability from a metalog object
### Aliases: qmetalog

### ** Examples

# Load example data
data("fishSize")

# Create a bounded metalog object
myMetalog <- metalog(fishSize$FishSize,
                     bounds=c(0, 60),
                     boundedness = 'b',
                     term_limit = 9,
                     term_lower_bound = 9)

s <- qmetalog(myMetalog,y=c(0.25,0.5,0.7),term = 9)



