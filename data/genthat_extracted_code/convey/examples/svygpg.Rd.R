library(convey)


### Name: svygpg
### Title: Linearization of the gender pay (wage) gap
### Aliases: svygpg svygpg.survey.design svygpg.svyrep.design
###   svygpg.DBIsvydesign
### Keywords: survey

### ** Examples

library(vardpoor)
library(survey)
data(ses)
names( ses ) <- gsub( "size" , "size_" , tolower( names( ses ) ) )
des_ses <- svydesign(id=~1, weights=~weights, data=ses)
des_ses <- convey_prep(des_ses)

# linearized design
svygpg(~earningshour, des_ses, ~sex)
# replicate-weighted design
des_ses_rep <-  as.svrepdesign( des_ses , type = "bootstrap" )
des_ses_rep <- convey_prep(des_ses_rep)

svygpg(~earningshour, des_ses_rep, ~sex)

## Not run: 
##D 
##D # database-backed design
##D library(MonetDBLite)
##D library(DBI)
##D dbfolder <- tempdir()
##D conn <- dbConnect( MonetDBLite::MonetDBLite() , dbfolder )
##D dbWriteTable( conn , 'ses' , ses )
##D 
##D dbd_ses <- svydesign(id=~1, weights=~weights, data="ses", dbname=dbfolder, dbtype="MonetDBLite")
##D dbd_ses <- convey_prep( dbd_ses )
##D 
##D svygpg(formula=~earningshour, design=dbd_ses, sex= ~sex)
##D 
##D dbRemoveTable( conn , 'ses' )
##D 
## End(Not run)




