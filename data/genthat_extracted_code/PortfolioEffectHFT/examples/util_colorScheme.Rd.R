library(PortfolioEffectHFT)


### Name: util_colorScheme
### Title: Color scheme for charts
### Aliases: util_colorScheme
### Keywords: PortfolioEffectHFT util_colorScheme

### ** Examples

## Not run: 
##D data(aapl.data) 
##D aapl.frame=data.frame(Data=aapl.data[,2],Time=as.POSIXct(aapl.data[,1]/1000, 
##D origin = "1970-01-01", tz = "America/New_York"),legend='AAPL')
##D ggplot() + geom_line(data=aapl.frame, aes(x=Time,y=Data,col=legend))+util_colorScheme()
## End(Not run)


