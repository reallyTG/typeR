library(soilDB)


### Name: loafercreek
### Title: Example 'SoilProfilecollection' Objects Returned by
###   'fetchNASIS'.
### Aliases: loafercreek gopheridge mineralKing
### Keywords: datasets

### ** Examples

## Not run: 
##D # load example dataset
##D data("gopheridge")
##D 
##D # what kind of object is this?
##D class(gopheridge)
##D 
##D # how many profiles?
##D length(gopheridge)
##D 
##D # there are 60 profiles, this calls for a split plot
##D par(mar=c(0,0,0,0), mfrow=c(2,1))
##D 
##D # plot soil colors
##D plot(gopheridge[1:30, ], name='hzname', color='soil_color')
##D plot(gopheridge[31:60, ], name='hzname', color='soil_color')
##D 
##D # need a larger top margin for legend
##D par(mar=c(0,0,4,0), mfrow=c(2,1))
##D # generate colors based on clay content
##D plot(gopheridge[1:30, ], name='hzname', color='clay')
##D plot(gopheridge[31:60, ], name='hzname', color='clay')
##D 
##D # single row and no labels
##D par(mar=c(0,0,0,0), mfrow=c(1,1))
##D # plot soils sorted by depth to contact
##D plot(gopheridge, name='', print.id=FALSE, plot.order=order(gopheridge$bedrckdepth))
##D 
##D # plot first 10 profiles
##D plot(gopheridge[1:10, ], name='hzname', color='soil_color', label='pedon_id', id.style='side')
##D 
##D # add rock fragment data to plot:
##D addVolumeFraction(gopheridge[1:10, ], colname='total_frags_pct')
##D 
##D # add diagnostic horizons
##D addDiagnosticBracket(gopheridge[1:10, ], kind='argillic horizon', col='red', offset=-0.4)
##D 
##D ## loafercreek
##D data("loafercreek")
##D # plot first 10 profiles
##D plot(loafercreek[1:10, ], name='hzname', color='soil_color', label='pedon_id', id.style='side')
##D 
##D # add rock fragment data to plot:
##D addVolumeFraction(loafercreek[1:10, ], colname='total_frags_pct')
##D 
##D # add diagnostic horizons
##D addDiagnosticBracket(loafercreek[1:10, ], kind='argillic horizon', col='red', offset=-0.4)
## End(Not run)



