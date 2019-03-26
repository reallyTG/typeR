library(Thermimage)


### Name: slopebypoint
### Title: Returns the slope from linear regression with x values as
###   equally spaced 1:length
### Aliases: slopebypoint

### ** Examples


## Define a vector of 50 random numbers from 1 to 100
y<-ceiling(runif(50, 0, 100))
# Calculate the slope with respect to the index values (i.e. 1 to 50)
# instead of an x axis, this will provide a slope value of y vs. index
s<-slopebypoint(y)
s

# same as if typing: 
lm(y~seq(0,length(y)-1,1))




