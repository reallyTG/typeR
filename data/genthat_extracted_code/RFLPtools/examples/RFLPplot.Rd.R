library(RFLPtools)


### Name: RFLPplot
### Title: Function to plot RFLP data.
### Aliases: RFLPplot
### Keywords: multivariate cluster

### ** Examples

data(RFLPdata)
par(mfrow = c(1,2))
plot(hclust(RFLPdist(RFLPdata, nrBands = 3)), cex = 0.7)
RFLPplot(RFLPdata, nrBands = 3, mar.bottom = 6, cex.axis = 0.8)

par(mfrow = c(1,2))
plot(hclust(RFLPdist2(RFLPdata, nrBands = 9, nrMissing = 1)), cex = 0.7)
RFLPplot(RFLPdata, nrBands = 9, nrMissing = 1, mar.bottom = 6, cex.axis = 0.8)


distfun <- function(x) dist(x, method = "maximum")
par(mfrow = c(1,2))
plot(hclust(RFLPdist(RFLPdata, nrBands = 3, distfun = distfun), 
            method = "average"), cex = 0.7, cex.lab = 0.7)
RFLPplot(RFLPdata, nrBands = 3, distfun = distfun, hclust.method = "average", 
         mar.bottom = 6, cex.axis = 0.8)



