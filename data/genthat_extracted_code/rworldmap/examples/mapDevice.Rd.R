library(rworldmap)


### Name: mapDevice
### Title: Creates a plot device set up for maps
### Aliases: mapDevice
### Keywords: device

### ** Examples


## Not run: 
##D #Basic Usage
##D mapDevice()
##D mapCountryData()
##D 
##D #2 by 2 plot
##D mapDevice(rows=2,columns=2)
##D columns<-c("BIODIVERSITY","EPI","ENVHEALTH","Population2005")
##D for(i in columns){
##D  mapCountryData(nameColumnToPlot=i)
##D }
##D #Creating a pdf that is 5 inches wide
##D mapDevice(device="pdf",width=5,file=tempfile())
##D mapCountryData()
##D dev.off()
##D 
## End(Not run)




