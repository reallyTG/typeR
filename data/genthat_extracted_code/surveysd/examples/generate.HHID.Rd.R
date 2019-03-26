library(surveysd)


### Name: generate.HHID
### Title: Generate new houshold ID for survey data with rotating panel
###   design taking into account split households
### Aliases: generate.HHID

### ** Examples

## Not run: 
##D library(surveysd)
##D library(laeken)
##D library(data.table)
##D 
##D eusilc <- surveysd:::demo.eusilc(n=4)
##D 
##D # create spit households
##D eusilc[,rb030split:=rb030]
##D year <- eusilc[,unique(year)]
##D year <- year[-1]
##D leaf_out <- c()
##D for(y in year){
##D   split.person <- eusilc[year==(y-1)&!duplicated(db030)&!db030%in%leaf_out,
##D                          sample(rb030,20)]
##D   overwrite.person <- eusilc[year==(y)&!duplicated(db030)&!db030%in%leaf_out,
##D                              .(rb030=sample(rb030,20))]
##D   overwrite.person[,c("rb030split","year_curr"):=.(split.person,y)]
##D 
##D   eusilc[overwrite.person,rb030split:=i.rb030split,on=.(rb030,year>=year_curr)]
##D   leaf_out <- c(leaf_out,
##D                 eusilc[rb030%in%c(overwrite.person$rb030,overwrite.person$rb030split),
##D                 unique(db030)])
##D }
##D 
##D # pid which are in split households
##D eusilc[,.(uniqueN(db030)),by=list(rb030split)][V1>1]
##D 
##D eusilc.new <- generate.HHID(eusilc,period="year",pid="rb030split",hid="db030")
##D 
##D # no longer any split households in the data
##D eusilc.new[,.(uniqueN(db030)),by=list(rb030split)][V1>1]
## End(Not run)




