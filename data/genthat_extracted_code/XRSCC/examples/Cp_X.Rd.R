library(XRSCC)


### Name: Cp_X
### Title: Calculates the process capability
### Aliases: Cp_X capability
### Keywords: capability sixsigma

### ** Examples

data(vol_sample)
results1<-xrs_gr(vol_sample)
results2<-X_it(results1)
# Type dev.off() function before use Cp_X
Cp_X(results2, LES=510, LEI=490, mu=500)



