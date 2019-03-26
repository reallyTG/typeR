library(survey)


### Name: hospital
### Title: Sample of obstetric hospitals
### Aliases: hospital
### Keywords: datasets

### ** Examples

data(hospital)
hospdes<-svydesign(strata=~oblevel, id=~hospno, weights=~weighta,
fpc=~tothosp, data=hospital)
hosprep<-as.svrepdesign(hospdes)

svytotal(~births, design=hospdes)
svytotal(~births, design=hosprep)




