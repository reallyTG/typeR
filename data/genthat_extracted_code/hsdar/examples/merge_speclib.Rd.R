library(hsdar)


### Name: merge
### Title: Merge speclibs
### Aliases: merge,Speclib,Speclib-method
### Keywords: utilities

### ** Examples

data(spectral_data)
sp1 <- spectral_data[c(1:10),]
sp2 <- spectral_data[c(11:20),]

## Merge two Speclibs
speclib_merged_1 <- merge(sp1, sp2)
nspectra(speclib_merged_1)

## Merge multiple Speclibs
sp3 <- spectral_data[c(21:30),]
speclib_merged_2 <- merge(sp1, sp2, sp3)
nspectra(speclib_merged_2)



