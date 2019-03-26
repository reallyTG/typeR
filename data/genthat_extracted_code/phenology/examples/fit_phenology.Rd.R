library(phenology)


### Name: fit_phenology
### Title: Fit the phenology parameters to timeseries of counts.
### Aliases: fit_phenology

### ** Examples

## Not run: 
##D library(phenology)
##D # Read a file with data
##D Gratiot <- read.delim("http://max2.ese.u-psud.fr/epc/conservation/BI/Complete.txt", 
##D header=FALSE)
##D data(Gratiot)
##D # Generate a formatted list nammed data_Gratiot 
##D data_Gratiot <- add_phenology(Gratiot, name="Complete", 
##D 		reference=as.Date("2001-01-01"), format="%d/%m/%Y")
##D # Generate initial points for the optimisation
##D parg <- par_init(data_Gratiot, fixed.parameters=NULL)
##D # Run the optimisation
##D result_Gratiot <- fit_phenology(data=data_Gratiot, 
##D 		fitted.parameters=parg, fixed.parameters=NULL)
##D data(result_Gratiot)
##D # Plot the phenology and get some stats
##D output <- plot(result_Gratiot)
##D # Use fit with co-factor
##D # First extract tide information for that place
##D td <- tide.info(year=2001, latitude=4.9167, longitude=-52.3333, tz="America/Cayenne")
##D td2 <- td[td$Tide=="High Tide", ]
##D td3 <- cbind(td2, Date=as.Date(td2$Date.Time))
##D td4 <- td3[(as.POSIXlt(td3$Date.Time)$hou<6) | (as.POSIXlt(td3$Date.Time)$hou>18), ]
##D with(td4, plot(Date.Time, Level, type="l"))
##D data_Gratiot$Complete$Date
##D td5 <- merge(data_Gratiot$Complete, td4, by.x="Date", by.y="Date")
##D td6 <- td5[, c("Date", "Level")]
##D parg <- par_init(data_Gratiot, fixed.parameters=NULL, add.cofactors="Level")
##D result_Gratiot_CF <- fit_phenology(data=data_Gratiot, 
##D 		fitted.parameters=parg, fixed.parameters=NULL, cofactors=td6, 
##D 		add.cofactors="Level")
##D compare_AIC(WithoutCF=result_Gratiot, WithCF=result_Gratiot_CF)
##D plot(result_Gratiot_CF)
##D 
##D # Example with two series fitted with different peaks but same Length of season
##D 
##D Gratiot2 <- Gratiot
##D Gratiot2[, 2] <- floor(Gratiot2[, 2]*runif(n=nrow(Gratiot2)))
##D data_Gratiot <- add_phenology(Gratiot, name="Complete",
##D                               reference=as.Date("2001-01-01"), format="%d/%m/%Y")
##D data_Gratiot <- add_phenology(Gratiot2, name="Complete2",
##D                               reference=as.Date("2001-01-01"), 
##D                               format="%d/%m/%Y", previous=data_Gratiot)
##D pfixed=c(Min=0)
##D p <- par_init(data_Gratiot, fixed.parameters = pfixed)
##D p <- c(p, Peak_Complete=175, Peak_Complete2=175)
##D p <- p[-4]
##D p <- c(p, Length=90)
##D p <- p[-(3:4)]
##D result_Gratiot <- fit_phenology(data=data_Gratiot, fitted.parameters=p, 
##D fixed.parameters=pfixed)
## End(Not run)



