library(rLiDAR)


### Name: CHMsmoothing
### Title: LiDAR-derived Canopy Height Model (CHM) smoothing
### Aliases: CHMsmoothing

### ** Examples


#=======================================================================#
# Importing the LiDAR-derived CHM file
data(chm) # or set a CHM. e.g. chm<-raster("CHM_stand.asc") 

#=======================================================================#
# Example 01: Smoothing the CHM using a Gaussian filter
#=======================================================================#
# Set the ws:
ws<-3 # dimension 3x3

# Set the filter type
filter<-"Gaussian"

# Set the sigma value
sigma<-0.6

# Smoothing CHM
sCHM<-CHMsmoothing(chm, filter, ws, sigma)

#=======================================================================# 
# Example 02: Smoothing the CHM using a mean filter
#=======================================================================#
# Set the ws:
ws<-5 # dimension 5x5

# Set the filter type
filter<-"mean"

# Smoothing and plotting LiDAR-derived CHM 
sCHM<-CHMsmoothing(chm, filter, ws)




