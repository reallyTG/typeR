library(GGIR)


### Name: g.plot
### Title: function to generate a plot for quality check purposes
### Aliases: g.plot

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

#impute meta-data:
IMP = g.impute(M = data.getmeta, I = data.inspectfile, strategy = 1,
hrs.del.start = 0, hrs.del.end = 0, maxdur = 0)

#plot data
g.plot(IMP, M = data.getmeta, I = data.inspectfile, durplot=4)



