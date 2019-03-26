library(adehabitatLT)


### Name: teal
### Title: Teal (Anas crecca) Ring Recovery Dataset
### Aliases: teal
### Keywords: datasets

### ** Examples

data(teal)

plot(teal[,1:2], asp=1,
     xlab="longitude", ylab="latitude",
     main="Capture site (red) and recoveries")

points(attr(teal, "CaptureSite"), pch=16,
       cex=2, col="red")



