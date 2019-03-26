library(rmetalog)


### Name: dmetalog
### Title: Generate density values with quantiles from a metalog object.
###   This is done through a newtons method approximation.
### Aliases: dmetalog

### ** Examples

# Load example data
data("fishSize")

# Create a bounded metalog object
myMetalog <- metalog(fishSize$FishSize,
                     bounds=c(0, 60),
                     boundedness = 'b',
                     term_limit = 9,
                     term_lower_bound = 9)

s <- dmetalog(myMetalog,q=c(3,10,25),term = 9)



