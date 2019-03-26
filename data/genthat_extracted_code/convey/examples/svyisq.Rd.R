library(convey)


### Name: svyisq
### Title: Linearization of the total below a quantile
### Aliases: svyisq svyisq.survey.design svyisq.svyrep.design
###   svyisq.DBIsvydesign
### Keywords: survey

### ** Examples

library(vardpoor)
data(eusilc) ; names( eusilc ) <- tolower( names( eusilc ) )
library(survey)
des_eusilc <- svydesign(ids = ~rb030, strata =~db040,  weights = ~rb050, data = eusilc)
des_eusilc <- convey_prep(des_eusilc)
svyisq(~eqincome, design=des_eusilc,.20 , quantile = TRUE)

# replicate-weighted design
des_eusilc_rep <- as.svrepdesign( des_eusilc , type = "bootstrap" )
des_eusilc_rep <- convey_prep(des_eusilc_rep)

svyisq( ~eqincome , design = des_eusilc_rep, .20 , quantile = TRUE )

## Not run: 
##D 
##D # linearized design using a variable with missings
##D svyisq( ~ py010n , design = des_eusilc, .20 )
##D svyisq( ~ py010n , design = des_eusilc , .20, na.rm = TRUE )
##D # replicate-weighted design using a variable with missings
##D svyisq( ~ py010n , design = des_eusilc_rep, .20 )
##D svyisq( ~ py010n , design = des_eusilc_rep , .20,  na.rm = TRUE )
##D 
##D # database-backed design
##D library(MonetDBLite)
##D library(DBI)
##D dbfolder <- tempdir()
##D conn <- dbConnect( MonetDBLite::MonetDBLite() , dbfolder )
##D dbWriteTable( conn , 'eusilc' , eusilc )
##D 
##D dbd_eusilc <-
##D 	svydesign(
##D 		ids = ~rb030 ,
##D 		strata = ~db040 , 
##D 		weights = ~rb050 ,
##D 		data="eusilc",
##D 		dbname=dbfolder,
##D 		dbtype="MonetDBLite"
##D 	)
##D 
##D dbd_eusilc <- convey_prep( dbd_eusilc )
##D 
##D svyisq( ~ eqincome , design = dbd_eusilc, .20 )
##D 
##D dbRemoveTable( conn , 'eusilc' )
##D 
##D dbDisconnect( conn , shutdown = TRUE )
##D 
## End(Not run)




