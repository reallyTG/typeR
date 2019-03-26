library(nowcasting)


### Name: base_extraction
### Title: Create a real time data base
### Aliases: base_extraction

### ** Examples

# Extracting GDP serie at real-time from Central Bank of Brasil data base
## Not run: 
##D gdp<-base_extraction(22099)
##D # Industrial production (21859) serie at real-time from Central Bank of Brasil data base
##D ind_prod<-base_extraction(21859)
##D 
##D # Creating real time data base with the series: 
##D # Vehicles production (1373);
##D # Industrial production, general index (21859).
##D mybase<-base_extraction(c(1373,21859))
##D 
##D # Creating real time data base with the series: 
##D # Exchange rate - Free - United States dollar (1);
##D #  Interest rate - CDI (12).
##D mybase<-base_extraction(c(1,12))
##D 
##D # Creating real time data base with the series: 
##D # Vehicles production (1373);
##D # Credit Sales Index (1453);
##D # Retail sales (1455);
##D # Industrial production, general index (21859).
##D mybase<-base_extraction(c(1373,1453,1455,21859))
## End(Not run)




