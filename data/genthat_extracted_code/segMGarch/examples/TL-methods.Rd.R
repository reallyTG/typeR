library(segMGarch)


### Name: TL
### Title: Method to backtest VaR violation using the Traffic Light (TL)
###   approach of Basel
### Aliases: TL TL-class TL-methods TL,ANY-method

### ** Examples

pw.CCC.obj = new("simMGarch")
pw.CCC.obj@d = 10
pw.CCC.obj@n = 1000
pw.CCC.obj@changepoints = c(250,750)
pw.CCC.obj = pc_cccsim(pw.CCC.obj)
y_out_of_sample = t(pw.CCC.obj@y[,900:1000])
w=rep(1/pw.CCC.obj@d,pw.CCC.obj@d) #an equally weighted portfolio
#VaR = quantile(t(pw.CCC.obj@y[,1:899])%*%w,0.05)
#ts.plot(y_out_of_sample%*%w,ylab="portfolio return");abline(h=VaR,col="red")
#TL(y=y_out_of_sample%*%w,VaR=rep(VaR,100),VaR_level = 0.95)



