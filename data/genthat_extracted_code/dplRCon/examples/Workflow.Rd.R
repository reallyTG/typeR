library(dplRCon)


### Name: Example 1
### Title: Example 1: Producing correlation figure
### Aliases: 'Example 1'

### ** Examples
 ## Not run: 
##D #library('dplRCon')
##D #loading data
##D data(ring.raw)
##D data(ring.stand)
##D data(dbh.po.nc)
##D data(SOI)
##D data(temperature)
##D data(precipitation)
##D #Subset "near-pith" is the material within 0 -20cm from the estimated pith
##D spline200.sub0.20.n   <- TruncSeriesPithoffset( ring.raw, ring.stand, dbh.po.nc, c(1,200))
##D # Subset "far-pith" is the material further than 20cm from the estimated pith
##D spline200.sub20.2000.n  <- TruncSeriesPithoffset( ring.raw, ring.stand, dbh.po.nc, c(200,200000))
##D # Whole dataset, through truncated functions to get in the same format as the above two datasets
##D spline200.sub0.2000.n  <- TruncSeriesPithoffset( ring.raw, ring.stand, dbh.po.nc, c(00,200000))
##D 
##D #series.bootstapped
##D boot.0.20   <-  series.bootstrap( spline200.sub0.20.n$sub.series.stand, stat, 999, 
##D names.stat, aver.by.tree = FALSE)
##D boot.20.2000   <- series.bootstrap(spline200.sub20.2000.n$sub.series.stand, stat, 999, 
##D names.stat, aver.by.tree = FALSE)
##D boot.full   <- series.bootstrap(spline200.sub0.2000.n$sub.series.stand, stat, 999, 
##D names.stat, aver.by.tree = FALSE)
##D 
##D #calculate seasonal climate
##D SOI.anom.season.data  <- climate.anom.dendro.season( SOI, 1933, 1992, 1876, is.anomaly="TRUE")
##D temp.anom.season.data	<- climate.anom.dendro.season( temperature, 1933, 1992, 1876, 
##D                 is.anomaly="TRUE")
##D prec.anom.season.data	<- climate.anom.dendro.season( precipitation, 1933, 1992, 1876, 
##D                 is.anomaly="TRUE")
##D 
##D # Calculate the correlations for each of the climate variables
##D period.RF<-c(1900,1990)
##D col.names.season <- list("SON_2", "DJF_2", "MAM_2", "JJA_2", "SON_1", "DJF_1", "MAM_1","JJA_1", 
##D "SON", "DJF", "MAM", "JJA")
##D 
##D ##	Full dataset
##D site.full <- site.chron(spline200.sub0.2000.n$sub.series.stand, aver.by.tree=FALSE)
##D site.chron.data <- cbind(site.full$aver.site, site.full$aver.site)
##D site.boot.full <- ts(boot.full$boot.series.mean, start=tsp(site.full$aver.site)[1] )
##D site.boot.data<-list(site.boot.full, site.boot.full) 	
##D corr.SOI.full<-correlation.function(SOI.anom.season.data, site.chron.data, site.boot.data, 
##D       period.RF,col.names.season, Climate.name="SOI", 
##D       Subset.name=c("0-20cm","20-200cm" ) )
##D corr.prec.full<-correlation.function(prec.anom.season.data, site.chron.data, site.boot.data, 
##D       period.RF, col.names.season, Climate.name="SOI",
##D       Subset.name=c("0-20cm","20-200cm" ) )
##D corr.temp.full<-correlation.function(temp.anom.season.data, site.chron.data, site.boot.data, 
##D       period.RF, col.names.season, Climate.name="SOI", 
##D       Subset.name=c("0-20cm","20-200cm" ) )
##D 
##D 
##D ##	Near vs Far
##D site.0.20  <- site.chron(spline200.sub0.20.n$sub.series.stand, aver.by.tree=FALSE)
##D site.20.200 <- site.chron(spline200.sub20.2000.n$sub.series.stand, aver.by.tree=FALSE)
##D site.chron.data <- cbind(site.0.20$aver.site, site.20.200$aver.site)
##D 
##D site.boot.0.20 <- ts(boot.0.20$boot.series.mean, start=tsp(site.0.20$aver.site)[1] )
##D site.boot.20.200 <- ts(boot.20.2000$boot.series.mean, start=tsp(site.20.200$aver.site)[1] )
##D site.boot.data<-list(site.boot.0.20, site.boot.20.200) 
##D 
##D 
##D corr.SOI<-correlation.function(SOI.anom.season.data, site.chron.data,site.boot.data, period.RF, 
##D col.names.season, Climate.name="SOI", Subset.name=c("0-20cm","20-200cm" ) )
##D corr.prec<-correlation.function(prec.anom.season.data, site.chron.data, site.boot.data, period.RF, 
##D col.names.season, Climate.name="SOI",  Subset.name=c("0-20cm","20-200cm" ) )
##D corr.temp<-correlation.function(temp.anom.season.data, site.chron.data, site.boot.data, period.RF, 
##D col.names.season, Climate.name="SOI",Subset.name=c("0-20cm","20-200cm" ) )
##D 
##D #Plotting
##D Figure.correlation.barplot(corr.temp, corr.prec, corr.SOI, 
##D         corr.temp.full, corr.prec.full, corr.SOI.full, 
##D         col.names.season)
## End(Not run)



