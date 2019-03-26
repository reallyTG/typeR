library(parallelML)


### Name: convertAverage
### Title: Take averages over a list of data.frames
### Aliases: convertAverage

### ** Examples

# Create a list of data.frames
frame1 <- data.frame(a=1:10,b=2:11)
frame2 <- data.frame(a=11:20,b=3:12)
frameList <- list(frame1,frame2)

# Take the respective averages
convertAverage(frameList)

# Create a list of vectors
vector1 <- 1:10
vector2 <- 11:20
vectorList <- list(vector1,vector2)

# Take the respective averages
convertAverage(vectorList)



