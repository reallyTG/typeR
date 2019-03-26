library(TeachingDemos)


### Name: char2seed
### Title: Convert a character string into a random seed
### Aliases: char2seed
### Keywords: datagen

### ** Examples

char2seed('Snow')
x <- rnorm(100)
rnorm(10)
tmp <- char2seed('Snow',set=FALSE)
set.seed(tmp)
y <- rnorm(100)

all.equal(x,y) # should be true




