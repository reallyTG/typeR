library(nordklimdata1)


### Name: NordklimStationCatalogue
### Title: The Nordklim Station Catalogue
### Aliases: NordklimStationCatalogue
### Keywords: datasets

### ** Examples

## Not run: 
##D data(NordklimStationCatalogue)
##D str(NordklimStationCatalogue)
##D # 114 stations
##D length(NordklimStationCatalogue$Nordklim.number)
##D # in 5 Nordic countries
##D length(NordklimStationCatalogue$Country)
##D # how many stations per country?
##D table(NordklimStationCatalogue$Country,dnn = 
##D list("Number of stations per country"))
##D # how many climate elements recorded per station?
##D climElSta <- rowSums(sign(NordklimStationCatalogue[,c('X101','X111','X112',
##D 'X113','X121','X122','X123','X401','X601','X602','X701','X801')]), 
##D na.rm = TRUE)
##D barplot(climElSta,ylab='Climate elements',xlab='Stations',
##D main='Climate elements recorded per station')
##D # how many stations per climate element?
##D staClimEl <- colSums(sign(NordklimStationCatalogue[,c('X101','X111','X112','X113','X121',
##D 'X122','X123','X401','X601','X602','X701','X801')]), na.rm = TRUE)
##D barplot(staClimEl,xlab='Climate element',ylab='Stations',
##D main='Stations per climate element')
##D # how many stations have 1,2,3, ..., 12 climate elements? 
##D # (same as Fig. 2 from Nordklim dataset 1.0 - description and illustrations)
##D barplot(table(climElSta),xlab='Climate element',ylab='Stations',
##D main='Number of stations as a function of number of climatic elements')
## End(Not run)



