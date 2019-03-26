library(SIBER)


### Name: maxLikOverlap
### Title: Calculate the overlap between two ellipses based on the maximum
###   likelihood fitted ellipses.
### Aliases: maxLikOverlap

### ** Examples

# load in the included demonstration dataset data("demo.siber.data")
siber.example <- createSiberObject(demo.siber.data) 

# The first ellipse is referenced using a character string representation 
# where in "x.y", "x" is the community, and "y" is the group within that 
# community.
ellipse1 <- "1.2" 

# Ellipse two is similarly defined: community 1, group3 
ellipse2 <- "1.3"

# the overlap betweeen the corresponding 95% prediction ellipses is given by: 
ellipse95.overlap <- maxLikOverlap(ellipse1, ellipse2, siber.example,
p.interval = 0.95, n = 100)




