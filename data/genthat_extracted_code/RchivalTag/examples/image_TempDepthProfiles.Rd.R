library(RchivalTag)


### Name: image_TempDepthProfiles
### Title: plots interpolated daily temperature at depth profiles
### Aliases: image_TempDepthProfiles

### ** Examples

#### example 1) run on PDT file:
## step I) read sample PDT data file:
path <- system.file("example_files",package="RchivalTag")
PDT <- read_PDT("104659-PDTs.csv",folder=path)
head(PDT)
# 
# ## step II) interpolate average temperature fields (MeanPDT) from PDT file:
# m <- interpolate_PDTs(PDT)
# str(m)
# m$sm
# 
# ## step III) calculate thermal stratifcation indicators per day (and tag):
# get_thermalstrat(m, all_info = TRUE)
# get_thermalstrat(m, all_info = FALSE)
# 
# ## step IV) plot interpolated profiles:
# image_TempDepthProfiles(m$station.1)
# 
# 
# #### example 2) run on time series data:
# ## step I) read sample time series data file:
# DepthTempTS <- read.table(system.file("example_files/104659-Series.csv",
#                                       package="RchivalTag"),header = TRUE,sep=',')
# DepthTempTS$date <- as.Date(DepthTempTS$Day,"%d-%b-%Y")
# head(DepthTempTS)
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




