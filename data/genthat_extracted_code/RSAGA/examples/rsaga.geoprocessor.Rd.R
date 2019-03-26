library(RSAGA)


### Name: rsaga.geoprocessor
### Title: Generic R interface for SAGA modules
### Aliases: rsaga.geoprocessor
### Keywords: interface spatial

### ** Examples

## Not run: 
##D rsaga.hillshade("dem","hillshade",exaggeration=2)
##D # using the RSAGA geoprocessor:
##D rsaga.geoprocessor("ta_lighting",0,list(ELEVATION="dem.sgrd",SHADE="hillshade",EXAGGERATION=2))
##D # equivalent DOS command line call:
##D # saga_cmd.exe ta_lighting 0 -ELEVATION dem.sgrd -SHADE hillshade -EXAGGERATION 2
## End(Not run)



