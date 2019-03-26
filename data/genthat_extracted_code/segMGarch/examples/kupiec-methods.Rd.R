library(segMGarch)


### Name: kupiec
### Title: Method to backtest VaR violation using the Kupiec statistics
### Aliases: kupiec kupiec-class kupiec-methods kupiec,ANY-method

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
#kupiec(y_out_of_sample%*%w,rep(VaR,100),.95,verbose=TRUE,test="PoF")



