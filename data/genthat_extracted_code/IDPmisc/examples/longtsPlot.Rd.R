library(IDPmisc)


### Name: longtsPlot
### Title: Plot Very Long Regular Time Series
### Aliases: longtsPlot
### Keywords: hplot iplot ts multivariate

### ** Examples

## sunspots, y-axis only on the left
data(sunspots)
longtsPlot(sunspots,upf=ceiling((end(sunspots)-start(sunspots))[1]/5))

## air quality (left axis) and meteo data (right axis)
## use xpd=TRUE for time series with rare but large values
if (require(SwissAir)) {
  data(AirQual)
  st <- 6.5*30*48
  x.at <- seq(st,nrow(AirQual),48)
  longtsPlot(y1=AirQual[,c("ad.O3","ad.NOx")], y2 = AirQual$ad.T,
             names1=c("O3","NOx"),names2 = "Temp",
             startP = st, upf=7*48,
             x.at = x.at, x.ann = substr(AirQual$start,1,6)[x.at],
             x.tick = seq(st,nrow(AirQual),12),
             y1.at = c(0,100), y1.tick = seq(0,150,50),
             y2.at = c(10,30), y2.tick = seq(10,30,10),
             y1lab="[ppb]", y2lab="[C]",
             y1lim = c(0,100), y2lim = c(10,30), xpd=TRUE,
             col2 = "red", type1 = "l")
}

## Two time series with different frequencies and start times
## on the same figures
set.seed(13)
len <- 4*6*400
x <- sin((1:len)/200*pi)
d <- sin(cumsum(1+ rpois(len, lambda= 2.5)))

y1 <- ts(10*x,start=0,frequency=6)+d*rnorm(len)
y2 <- ts(100*x,start=100,frequency=13)+10*rnorm(len)
longtsPlot(y1,y2)

## plot your own legend
longtsPlot(sunspots, upf = ceiling((end(sunspots)-start(sunspots))[1]/5),
           fpp = 1, leg = FALSE)
legend(1750, 260, legend = "Monthly Sunspot Numbers", col = "blue", lwd = 1,
       bty = "n")



