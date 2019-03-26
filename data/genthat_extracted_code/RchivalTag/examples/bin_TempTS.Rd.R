library(RchivalTag)


### Name: bin_TempTS
### Title: bin depth-temperature time series data
### Aliases: bin_TempTS

### ** Examples


# #### example 1) run on time series data:
## step I) read sample time series data file:
DepthTempTS <- read.table(system.file("example_files/104659-Series.csv",
                                       package="RchivalTag"),header = TRUE,sep=',')
DepthTempTS$date <- as.Date(DepthTempTS$Day,"%d-%b-%Y")
head(DepthTempTS)
# 
# 
# ## step Ib) bin temperature data on 10m depth bins 
# ##          to increase later estimate accuracy (see Bauer et al. 2015):
# # DepthTempTS_binned <- bin_TempTS(DepthTempTS,res=10)
# 
# ## step II) interpolate average temperature fields (MeanTemp) from binned data:
# m <- interpolate_TempDepthProfiles(DepthTempTS)
# # m <- interpolate_PDTs(DepthTempTS_binned)
# str(m)
# m$sm
# 
# ## step III) calculate thermal stratifcation indicators per day (and tag):
# get_thermalstrat(m, all_info = TRUE)
# get_thermalstrat(m, all_info = FALSE)
# 
# ## step IV) plot interpolated profiles:
# image_TempDepthProfiles(m$station.1)




