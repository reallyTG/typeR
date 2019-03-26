library(IgorR)


### Name: read.ibw
### Title: Read binary files in the Igor Binary Wave format (IBW)
### Aliases: read.ibw

### ** Examples

# return a list containing the wave
wavedata=read.ibw(system.file("igor","version5.ibw",package="IgorR")) 
sum(wavedata)

# make a list containing the wave's data in the users's environment
wavename=read.ibw(system.file("igor","version5.ibw",package="IgorR"),MakeWave=TRUE) 
sum(get(wavename))



