library(cellVolumeDist)


### Name: A10_vSMC_volume_data
### Title: Volume distribution data for A10 vSMC cell cultures
### Aliases: A10_vSMC_volume_data Aph0_a Aph0_b Aph0_c Aph0_d Aph50_a
###   Aph50_b Aph50_c Aph50_d Aph100_a Aph100_b Aph100_c Aph100_d tAph0_a
###   tAph0_b tAph0_c tAph0_d tAph50_a tAph50_b tAph50_c tAph50_d tAph100_a
###   tAph100_b tAph100_c tAph100_d volumes_A10_vSMC
### Keywords: datasets

### ** Examples

data(A10_vSMC_volume_data)
plot(volumes_A10_vSMC, Aph100_b,
main=expression(paste("Distribution of cell volumes (",mu, m^3,")",sep="")),
type="b", pch=20, ylab="frequency",
xlab=expression(paste("volume (",mu, m^3,")", sep="")))



