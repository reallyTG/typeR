library(forestSAS)


### Name: buffer
### Title: Identify the buffer zone in the point pattern
### Aliases: buffer

### ** Examples

library(spatstat)
####Based on the simulated data####
# Creating a simulated point pattern
x <- runif(20)
y <- runif(20)
X <- ppp(x, y, c(0,1), c(0,1))
X
# Identifing the buffer zone and core zone in the point pattern
# The width of buffer zone in the x coordinates of data points is 0.2
# The width of buffer zone in the y coordinates of data points is 0.3
X_buf<-buffer(X,buf.xwid =0.2,buf.ywid=0.3)
X_buf
as.data.frame(X_buf)

####Based on the example data####
data(finpines)
finpines
# Marked planar point pattern: 126 points
# Mark variables: diameter, height
# window: rectangle = [-5, 5] x [-8, 2] metres

# Identifing the buffer zone and core zone in the finpines
# The width of buffer zone in the x coordinates of finpines is 2
# The width of buffer zone in the y coordinates of finpines is 3
finpines_buf<-buffer(finpines,buf.xwid =2,buf.ywid=3)
finpines_buf
as.data.frame(finpines_buf)



