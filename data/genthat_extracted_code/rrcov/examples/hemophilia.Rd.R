library(rrcov)


### Name: hemophilia
### Title: Hemophilia Data
### Aliases: hemophilia
### Keywords: datasets

### ** Examples

data(hemophilia)
plot(AHFantigen~AHFactivity, data=hemophilia, col=as.numeric(as.factor(gr))+1)
##
## Compute robust location and covariance matrix and 
## plot the tolerance ellipses
(mcd <- CovMcd(hemophilia[,1:2]))
col <- ifelse(hemophilia$gr == "carrier", 2, 3) ## define clours for the groups
plot(mcd, which="tolEllipsePlot", class=TRUE, col=col)




