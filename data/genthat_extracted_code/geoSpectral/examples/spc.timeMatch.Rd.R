library(geoSpectral)


### Name: spc.timeMatch
### Title: Match two time sequences
### Aliases: spc.timeMatch

### ** Examples

#Read the Nomad database inside a SpcList object.
dat = SpcList(spc.Read_NOMAD_v2())

#Different list elements containt different parameters
names(dat)

#We would like to find elements of Es that match time-wise rows of Kd.
nrow(dat$kd); nrow(dat$es)

#Use spc.timeMatch() to get row indexes of Es that would match those of Kd time-wise
t_idx=spc.timeMatch((dat$kd), (dat$es))
#Verification
all(time(dat$es)[t_idx]==time(dat$kd))





