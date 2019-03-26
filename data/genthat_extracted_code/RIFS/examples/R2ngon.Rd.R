library(RIFS)


### Name: R2ngon
### Title: Regular polygonal protofractal set in R^2
### Aliases: R2ngon

### ** Examples

plot(R2ngon(n1=90, cycle=TRUE), type="l", asp=1, col="gray",
     main="Regular {3,4,5,7,11}-gonal sets in R^2")
for (n in c(3,4,5,7,11)) 
  lines(R2ngon(n1=n, cycle=TRUE), 
        type="b", pch=16, col=hsv(h=(n-2)/9,v=0.9))



