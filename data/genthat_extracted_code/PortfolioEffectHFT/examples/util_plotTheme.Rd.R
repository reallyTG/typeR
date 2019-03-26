library(PortfolioEffectHFT)


### Name: util_plotTheme
### Title: Plot style settings for PortfolioEffect theme
### Aliases: util_plotTheme
### Keywords: PortfolioEffectHFT util_plotTheme

### ** Examples

## Not run: 
##D data(aapl.data) 
##D aapl.frame=data.frame(Data=aapl.data[,2],Time=as.POSIXct(aapl.data[,1]/1000, 
##D origin = "1970-01-01", tz = "America/New_York"),legend='AAPL')
##D ggplot() + geom_line(data=aapl.frame, aes(x=Time,y=Data,col=legend))+
##D util_plotTheme()+util_colorScheme()+util_fillScheme()
## End(Not run)


