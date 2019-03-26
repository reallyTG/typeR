library(extremefit)


### Name: LoadCurve
### Title: Load curve of an habitation
### Aliases: LoadCurve

### ** Examples

data("LoadCurve")

X<-LoadCurve$data$Value
days<-LoadCurve$data$Time
Tgrid <- seq(min(days), max(days), length = 400)
new.Tgrid <- LoadCurve$Tgrid
## Not run: 
##D  #For computing time purpose
##D # Choice of the bandwidth by cross validation. 
##D # We choose the truncated Gaussian kernel and the critical value 
##D # of the goodness-of-fit test 3.4. 
##D # As the computing time is high, we give the value of the bandwidth.
##D 
##D #hgrid <- bandwidth.grid(0.8, 5, 60)
##D #hcv<-bandwidth.CV(X=X, t=days, new.Tgrid, hgrid, pcv = 0.99,
##D #                 kernel = TruncGauss.kernel, CritVal = 3.4, plot = FALSE)
##D #h.cv <- hcv$h.cv
##D 
##D h.cv <- 3.444261
##D HH<-hill.ts(X, days, new.Tgrid, h=h.cv, kernel = TruncGauss.kernel, CritVal = 3.4)
##D 
##D Quant<-rep(NA,length(Tgrid))
##D Quant[match(new.Tgrid, Tgrid)]<-as.numeric(predict(HH, 
##D             newdata = 0.99, type = "quantile")$y)
##D             
##D Date<-as.POSIXct(days*86400, origin = "1970-01-01",
##D                  tz = "Europe/Paris")
##D plot(Date, X/1000, ylim = c(0, 8),
##D       type = "l", ylab = "Electric consumption (kVA)", xlab = "Time")
##D 
##D lines(as.POSIXlt((Tgrid)*86400, origin = "1970-01-01",
##D                  tz = "Europe/Paris"), Quant/1000, col = "red")
## End(Not run)



