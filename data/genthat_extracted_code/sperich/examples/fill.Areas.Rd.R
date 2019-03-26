library(sperich)


### Name: fill.Areas
### Title: Fill Algorithm
### Aliases: fill.Areas

### ** Examples

##initialize data
m <- matrix(0,10,10)
m[2:8,2] <- 1
m[2:8,8] <- 1
m[2,2:8] <- 1
m[8,2:8] <- 1

##initialize mask (in this case: empty mask)
mask <- matrix(0,10,10)

##calculate the distance of the two points
m <- fill.Areas(m, mask)
image(m)



