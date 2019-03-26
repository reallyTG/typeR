library(geospt)


### Name: pocket.plot
### Title: graphs the probability or standardized variance in the
###   directions north-south or east-west
### Aliases: pocket.plot
### Keywords: spatial

### ** Examples

# Core measurements (in % coal ash) at reoriented locations. 
# Units on the vertical axis are % coal ash.

# These data was found in mining samples originally reported by 
# Gomez and Hazen (1970), and later used by Cressie (1993). 

# These data are available in the sp and gstat packages

library(gstat)
data(coalash) 
plot(coalash[,1:2], type="n", xlab="x", ylab="y") 
text(coalash$x,coalash$y,coalash$coalash,cex=0.6)

# Pocket plot in the north-south direction. 
# Units on the vertical axis are root (% coal ash) 

# Plot generated with the function pocket.plot 
# Clearly rows 2, 6, and 8 are atypical 

# This serves as verification that these rows are potentially problematic

# Analysis of local stationarity in probabilities of the coal in south-north direction 

pocket.plot(coalash, "PPR", coalash$x, coalash$y, coalash$coalash, FALSE)

# Analysis of local stationarity in variance of the coal in south-north direction 

pocket.plot(coalash, "PVR", coalash$x, coalash$y, coalash$coalash, FALSE) 

# Analysis of local stationarity in probabilities of the coal in east-west direction 

pocket.plot(coalash, "PPC", coalash$x, coalash$y, coalash$coalash, FALSE) 

# Analysis of local stationarity in variance of the coal in east-west direction 

pocket.plot(coalash, "PVC", coalash$x, coalash$y, coalash$coalash, FALSE)



