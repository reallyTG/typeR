library(vegdata)


### Name: tv.veg
### Title: Tabulates vegetation tables from Turboveg database
### Aliases: tv.veg tv.db
### Keywords: misc,manip,survey

### ** Examples

## Not run: 
##D vignette("vegdata")
##D # If you have Turboveg installed on your computer try for a beginning 
##D # tv.veg('databasename', tax=FALSE).
##D args(tv.veg)
##D help('taxval')
##D 
##D veg <- tv.veg('taxatest')
##D names(veg)
##D tv.veg('taxatest', uncertain=list('DET_CERT', data.frame(0:2,c('pres','agg','agg'))), 
##D pseudo=list(lc.0,'LAYER'), genus = 'delete')
## End(Not run)



