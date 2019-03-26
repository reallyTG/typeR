library(cellVolumeDist)


### Name: NIH3T3_volume_data
### Title: Volume distribution data for NIH3T3 cell cultures
### Aliases: NIH3T3_volume_data NIH3T3_a NIH3T3_b NIH3T3_c NIH3T3_d
###   tNIH3T3_a tNIH3T3_b tNIH3T3_c tNIH3T3_d volumes_nih3t3
### Keywords: datasets

### ** Examples

data(NIH3T3_volume_data)
plot(volumes_nih3t3, NIH3T3_d,
main=expression(paste("Distribution of cell volumes (",mu,m^3,")", sep="")), 
type="b", pch=20, ylab="frequency",
xlab=expression(paste("volume (",mu,m^3,")", sep="")))




