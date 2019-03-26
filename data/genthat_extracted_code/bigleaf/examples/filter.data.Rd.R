library(bigleaf)


### Name: filter.data
### Title: Basic Eddy Covariance Data Filtering
### Aliases: filter.data

### ** Examples

# Example of data filtering; data are for a month within the growing season,
# hence growing season is not filtered.
# If filtered.data.to.NA=TRUE, all values of a row are set to NA if one filter
# variable is beyond its bounds. 
DE_Tha_Jun_2014_2 <- filter.data(DE_Tha_Jun_2014,quality.control=FALSE,
                                 vars.qc=c("Tair","precip","H","LE"),
                                 filter.growseas=FALSE,filter.precip=TRUE,
                                 filter.vars=c("Tair","PPFD","ustar"),
                                 filter.vals.min=c(5,200,0.2),
                                 filter.vals.max=c(NA,NA,NA),NA.as.invalid=TRUE,
                                 quality.ext="_qc",good.quality=c(0,1),
                                 missing.qc.as.bad=TRUE,GPP="GPP",doy="doy",
                                 year="year",tGPP=0.5,ws=15,min.int=5,precip="precip",
                                 tprecip=0.1,precip.hours=24,records.per.hour=2,
                                 filtered.data.to.NA=TRUE)

 ## same, but with filtered.data.to.NA=FALSE
 DE_Tha_Jun_2014_3 <- filter.data(DE_Tha_Jun_2014,quality.control=FALSE,
                                 vars.qc=c("Tair","precip","H","LE"),
                                 filter.growseas=FALSE,filter.precip=TRUE,
                                 filter.vars=c("Tair","PPFD","ustar"),
                                 filter.vals.min=c(5,200,0.2),
                                 filter.vals.max=c(NA,NA,NA),NA.as.invalid=TRUE,
                                 quality.ext="_qc",good.quality=c(0,1),
                                 missing.qc.as.bad=TRUE,GPP="GPP",doy="doy",
                                 year="year",tGPP=0.5,ws=15,min.int=5,precip="precip",
                                 tprecip=0.1,precip.hours=24,records.per.hour=2,
                                 filtered.data.to.NA=FALSE)
                                 
 # note the additional column 'valid' in DE_Tha_Jun_2014_3.
 # To remove time steps marked as filtered out (i.e. 0 values in column 'valid'):
 DE_Tha_Jun_2014_3[DE_Tha_Jun_2014_3["valid"] == 0,] <- NA
  
  



