library(IDPmisc)


### Name: ilagplot
### Title: Image Lag Plot Matrix for Large Time Series
### Aliases: ilagplot
### Keywords: hplot

### ** Examples

if(require(SwissAir)) {
  data(AirQual)

  ilagplot(AirQual[,c("ad.O3")],set.lags = 1:4,
           ztransf = function(x){x[x<1] <- 1; log2(x)},
           main = "Low correlation")

  Ox <- AirQual[,c("ad.O3","lu.O3","sz.O3")]+
    AirQual[,c("ad.NOx","lu.NOx","sz.NOx")]-
      AirQual[,c("ad.NO","lu.NO","sz.NO")]
  names(Ox) <- c("ad","lu","sz")
  ilagplot(Ox$ad,set.lags = 1:4,
           ztransf = function(x){x[x<1] <- 1; log2(x)},
           main = "High correlation")

  ## cf. ?AirQual for the explanation of the physical
  ## and chemical background
} else print("Package SwissAir is not available")



