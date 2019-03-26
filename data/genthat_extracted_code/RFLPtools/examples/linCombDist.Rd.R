library(RFLPtools)


### Name: linCombDist
### Title: Linear Combination of Distances
### Aliases: linCombDist
### Keywords: multivariate

### ** Examples

## assume a shift in the measured bands
M <- rbind(c(550, 500, 300, 250), c(510, 460, 260, 210),
           c(700, 650, 450, 400), c(550, 490, 310, 250))
dist(M)
diffDist(M)

## convex combination of dist and diffDist
linCombDist(M, distfun1 = dist, w1 = 0.5, distfun2 = diffDist, w2 = 0.5)

## linear combination
linCombDist(M, distfun1 = dist, w1 = 2, distfun2 = diffDist, w2 = 5)

## maximum distance
linCombDist(M, distfun1 = function(x) dist(x, method = "maximum"), w1 = 0.5, 
            distfun2 = function(x) diffDist(x, method = "maximum"), w2 = 0.5)
            
data(RFLPdata)
distfun <- function(x) linCombDist(x, distfun1 = dist, w1 = 0.1, distfun2 = diffDist, w2 = 0.9)
par(mfrow = c(2, 2))
plot(hclust(RFLPdist(RFLPdata, nrBands = 3, distfun = distfun)), cex = 0.7, cex.lab = 0.7)
RFLPplot(RFLPdata, nrBands = 3, distfun = distfun, mar.bottom = 6, cex.axis = 0.8)
plot(hclust(RFLPdist(RFLPdata, nrBands = 3)), cex = 0.7, cex.lab = 0.7)
RFLPplot(RFLPdata, nrBands = 3, mar.bottom = 6, cex.axis = 0.8)



