library(soilDB)


### Name: fetchKSSL
### Title: Fetch KSSL Data
### Aliases: fetchKSSL
### Keywords: utilities

### ** Examples

## Not run: 
##D # search by series name
##D s <- fetchKSSL(series='auburn')
##D 
##D # search by bounding-box
##D # s <- fetchKSSL(bbox=c(-120, 37, -122, 38))
##D 
##D # how many pedons
##D length(s)
##D 
##D # plot 
##D par(mar=c(0,0,0,0))
##D plot(s, name='hzn_desgn', max.depth=150)
##D 
##D ##
##D ## morphologic data
##D ##
##D 
##D library(soilDB)
##D library(plyr)
##D library(reshape2)
##D 
##D 
##D # get lab and morphologic data
##D s <- fetchKSSL(series='auburn', returnMorphologicData = TRUE)
##D 
##D # extract SPC
##D pedons <- s$SPC
##D 
##D ## simplify color data manually
##D s.colors <- simplifyColorData(s$morph$phcolor, id.var = 'labsampnum', wt='colorpct')
##D 
##D # merge color data into SPC
##D h <- horizons(pedons)
##D h <- join(h, s.colors, by='labsampnum', type='left', match='first')
##D horizons(pedons) <- h
##D 
##D # check
##D par(mar=c(0,0,0,0))
##D plot(pedons, color='moist_soil_color', print.id=FALSE)
##D 
##D ## automatically simplify color data
##D s <- fetchKSSL(series='auburn', returnMorphologicData = TRUE, simplifyColors=TRUE)
##D 
##D # check
##D par(mar=c(0,0,0,0))
##D plot(pedons, color='moist_soil_color', print.id=FALSE)
##D 
##D 
##D # simplify fragment data
##D s.frags <- simplfyFragmentData(s$morph$phfrags, id.var='labsampnum')
##D 
##D # merge fragment data into SPC
##D h <- horizons(pedons)
##D h <- join(h, s.frags, by='labsampnum', type='left', match='first')
##D horizons(pedons) <- h
##D 
##D 
##D # check
##D par(mar=c(0,0,3,0))
##D plot(pedons, color='total_frags_pct', print.id=FALSE)
##D 
##D 
## End(Not run)



