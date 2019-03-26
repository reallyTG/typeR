library(remote)


### Name: names
### Title: Names of Eot* objects
### Aliases: names names,EotMode-method names,EotStack-method names<-
###   names<-,EotMode-method names<-,EotStack-method

### ** Examples

data(vdendool)

nh_modes <- eot(vdendool, n = 2)

## mode names
names(nh_modes)
names(nh_modes) <- c("vdendool1", "vdendool2")

names(nh_modes)
names(nh_modes[[2]])




