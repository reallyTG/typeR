library(nordklimdata1)


### Name: NordklimData
### Title: The Nordklim Dataset
### Aliases: NordklimData
### Keywords: datasets

### ** Examples

## Not run: 
##D data(NordklimData)
##D str(NordklimData)
##D # get all the country codes
##D countries <- unique(NordklimData$CountryCode)
##D # earliest and latest year of data collection
##D minFirstYear<- min(NordklimData$FirstYear)
##D maxFirstYear<- max(NordklimData$FirstYear)
##D allyears <- min(NordklimData$FirstYear):max(NordklimData$FirstYear)
##D # get the yearly average of all records
##D avgNordk <- cbind(NordklimData[,c('CountryCode','ClimateElement','FirstYear',
##D 'NordklimNumber')], 
##D YrAvg=apply(NordklimData[,c('January','February','March','April','May','June',
##D 'July','August','September', 'October','November','December')],1,function(x) 
##D {x[x==-9999]<-NA;mean(x,na.rm = TRUE)}))
##D str(avgNordk)
##D # plot the Danish mean temperatures for its 5 stations (for a quick visual 
##D # inspection, no need for labels or legends)
##D DanavgNordk <- avgNordk[which(avgNordk$CountryCode=='DK' & 
##D avgNordk$ClimateElement==101),c('FirstYear','YrAvg','NordklimNumber')]
##D p <- unique(DanavgNordk$NordklimNumber)
##D for (Dp in p) { plot(DanavgNordk[which(DanavgNordk$NordklimNumber==Dp),
##D c('FirstYear','YrAvg')],type='l',col=( which(Dp==p)),
##D xlim=c(min(DanavgNordk$FirstYear), max(DanavgNordk$FirstYear)),
##D ylim=c(60,120)); if (Dp != p[length(p)]) par(new=T)}
##D # average each country
##D avgNordkCountry=aggregate(YrAvg ~ CountryCode+ClimateElement+FirstYear , 
##D data = avgNordk, function(x) {x[x==-9999]<-NA;mean(x,na.rm = TRUE)})
##D str(avgNordkCountry)
##D # plot the temperatures (mean of all stations) for each country
##D for (country in countries) { plot(avgNordkCountry[
##D which(avgNordkCountry$CountryCode==country & avgNordkCountry$ClimateElement==101),
##D c('FirstYear','YrAvg')],type='l',col=( which(country==countries)),
##D xlim=c(minFirstYear, maxFirstYear),ylim=c(0,120),
##D main='Mean of yearly means of all stations for each country',
##D xlab='Years',ylab='Mean temperature'); 
##D if (country != countries[length(countries)]) par(new=T)}
##D legend('topleft', legend = countries, col=1:5, pch=1, lty=1, merge=TRUE)
## End(Not run)



