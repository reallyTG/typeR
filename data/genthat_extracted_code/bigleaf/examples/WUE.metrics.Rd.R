library(bigleaf)


### Name: WUE.metrics
### Title: Water-Use Efficiency Metrics
### Aliases: WUE.metrics

### ** Examples

## filter data for dry periods and daytime at DE-Tha in June 2014
DE_Tha_Jun_2014_2 <- filter.data(DE_Tha_Jun_2014,quality.control=FALSE,
                                 vars.qc=c("Tair","precip","VPD","H","LE"),
                                 filter.growseas=FALSE,filter.precip=TRUE,
                                 filter.vars=c("Tair","PPFD","ustar"),
                                 filter.vals.min=c(5,200,0.2),
                                 filter.vals.max=c(NA,NA,NA),NA.as.invalid=TRUE,
                                 quality.ext="_qc",good.quality=c(0,1),
                                 missing.qc.as.bad=TRUE,GPP="GPP",doy="doy",
                                 year="year",tGPP=0.5,ws=15,min.int=5,precip="precip",
                                 tprecip=0.1,precip.hours=24,records.per.hour=2)

## calculate WUE metrics in the filtered periods
WUE.metrics(DE_Tha_Jun_2014_2)
                        



