library(rugarch)


### Name: DateTimeUtilities
### Title: A small set of utilities to work with some time and date
###   classes.
### Aliases: move generatefwd ftseq

### ** Examples

## Not run: 
##D data(sp500ret)
##D spec = ugarchspec()
##D fit = ugarchfit(spec, sp500ret, out.sample=10)
##D forc = ugarchforecast(fit, n.ahead = 25, n.roll = 10)
##D f = fitted(forc)
##D # this is a 25 x 11 matrix [n.ahead x (n.roll+1)]
##D # colnames: T+0 date index
##D T0 = as.POSIXct(colnames(f))
##D rollT1 = move(T0, by=1)
##D # rolling estimation
##D plot(xts(f["T+1",],rollT1))
##D # unconditional estimates:
##D par(mfrow=c(3,4))
##D for(i in 1:11){
##D # difftime is always in model$modeldata$period
##D D=generatefwd(T0[i], length.out = 25, by = forc@model$modeldata$period)
##D plot(xts(f[,i], D), main=paste("T+0:",as.character(T0[i]),sep=""), auto.grid=FALSE)
##D }
##D ############################
##D ## Intraday Sequency Example
##D ############################
##D T0 = as.POSIXct("2001-01-01 16:00:00")
##D # remember to remove the backslash from the code below
##D interval = format(seq(as.POSIXct("2001-01-01 09:30:00"), as.POSIXct("2001-01-01 16:00:00"), 
##D by="min"), "%H:%M:%S")
##D by = "mins"
##D length.out=1000
##D R = ftseq(T0, length.out, by, interval)
## End(Not run)


