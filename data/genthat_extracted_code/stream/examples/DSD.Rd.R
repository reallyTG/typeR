library(stream)


### Name: DSD
### Title: Data Stream Data Generator Base Classes
### Aliases: DSD DSD_R description description DSD_R DSD_R

### ** Examples

# create data stream with three clusters in 3-dimensional space 
stream <- DSD_Gaussians(k=3, d=3)

# get points from stream
get_points(stream, n=5)  

# get points with true cluster assignment
p <- get_points(stream, n=5, cluster=TRUE)
attr(p, "cluster")
  
# plotting the data (scatter plot matrix, first and third dimension, and first
#  two principal components)
plot(stream)
plot(stream, dim=c(1,3))
plot(stream, method="pc")



