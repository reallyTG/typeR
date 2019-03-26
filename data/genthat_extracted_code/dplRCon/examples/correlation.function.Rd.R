library(dplRCon)


### Name: correlation.function
### Title: Performs correlations functions
### Aliases: correlation.function

### ** Examples

## Not run: 
##D period.RF<-c(1900,1990)
##D col.names.season <- list("SON_2", "DJF_2", "MAM_2", "JJA_2", "SON_1", "DJF_1", "MAM_1","JJA_1",
##D          "SON", "DJF", "MAM", "JJA")
##D ##  Full dataset
##D site.full <- site.chron(spline200.sub0.2000.n$sub.series.stand, aver.by.tree=F)
##D site.chron.data <- cbind(site.full$aver.site, site.full$aver.site)
##D site.boot.full <- ts(boot.full$boot.series.mean, start=tsp(site.full$aver.site)[1] )
##D site.boot.data<-list(site.boot.full, site.boot.full)
##D 
##D corr.SOI.full<-correlation.function(SOI.anom.season.data, site.chron.data,site.boot.data,
##D       period.RF, col.names.season,
##D       Climate.name="SOI", Subset.name=c("0-20cm","20-200cm" ) )
##D corr.prec.full<-correlation.function(prec.anom.season.data, site.chron.data,site.boot.data,
##D      period.RF, col.names.season,
##D      Climate.name="SOI", Subset.name=c("0-20cm","20-200cm" ) )
##D corr.temp.full<-correlation.function(temp.anom.season.data, site.chron.data,site.boot.data,
##D      period.RF, col.names.season,
##D      Climate.name="SOI", Subset.name=c("0-20cm","20-200cm" ) )
##D 
##D ##	Near vs Far
##D site.0.20  <- site.chron(spline200.sub0.20.n$sub.series.stand, aver.by.tree=F)
##D site.20.200 <- site.chron(spline200.sub20.2000.n$sub.series.stand, aver.by.tree=F)
##D site.chron.data <- cbind(site.0.20$aver.site, site.20.200$aver.site)
##D 
##D site.boot.0.20 <- ts(boot.0.20$boot.series.mean, start=tsp(site.0.20$aver.site)[1] )
##D site.boot.20.200 <- ts(boot.20.2000$boot.series.mean, start=tsp(site.20.200$aver.site)[1] )
##D site.boot.data<-list(site.boot.0.20, site.boot.20.200)
##D 
##D corr.SOI<-correlation.function(SOI.anom.season.data, site.chron.data, site.boot.data,
##D    period.RF, col.names.season,
##D    Climate.name="SOI",Subset.name=c("0-20cm","20-200cm" ) )
##D corr.prec<-correlation.function(prec.anom.season.data, site.chron.data,          site.boot.data,
##D    period.RF, col.names.season,
##D    Climate.name="SOI", Subset.name=c("0-20cm","20-200cm" ) )
##D corr.temp<-correlation.function(temp.anom.season.data, site.chron.data, site.boot.data,
##D    period.RF, col.names.season,
##D    Climate.name="SOI", Subset.name=c("0-20cm","20-200cm" ) )
## End(Not run)



