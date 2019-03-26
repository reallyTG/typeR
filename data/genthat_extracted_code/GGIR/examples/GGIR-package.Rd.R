library(GGIR)


### Name: GGIR-package
### Title: A package to process multi-day raw accelerometer data
### Aliases: GGIR-package GGIR

### ** Examples

## Not run: 
##D   #inspect file:
##D   I = g.inspectfile(datafile)
##D 
##D   #autocalibration:
##D   C = g.calibrate(datafile)
##D 
##D   #get meta-data:
##D   M = g.getmeta(datafile)
## End(Not run)
data(data.getmeta)
data(data.inspectfile)
data(data.calibrate)

#impute meta-data:
IMP = g.impute(M = data.getmeta, I = data.inspectfile)
#analyse and produce summary:
A = g.analyse(I = data.inspectfile, C = data.calibrate, M = data.getmeta, IMP)
#plot data
g.plot(IMP, M = data.getmeta, I = data.inspectfile, durplot=4)



