library(convey)


### Name: svypoormed
### Title: Relative median poverty gap
### Aliases: svypoormed svypoormed.survey.design svypoormed.svyrep.design
###   svypoormed.DBIsvydesign
### Keywords: survey

### ** Examples


library(survey)
library(vardpoor)
data(eusilc) ; names( eusilc ) <- tolower( names( eusilc ) )

# linearized design
des_eusilc <- svydesign( ids = ~rb030 , strata = ~db040 ,  weights = ~rb050 , data = eusilc )
des_eusilc <- convey_prep( des_eusilc )

svypoormed( ~eqincome , design = des_eusilc )

# replicate-weighted design
des_eusilc_rep <- as.svrepdesign( des_eusilc , type = "bootstrap" )
des_eusilc_rep <- convey_prep( des_eusilc_rep )

svypoormed( ~eqincome , design = des_eusilc_rep )

## Not run: 
##D 
##D # linearized design using a variable with missings
##D svypoormed( ~ py010n , design = des_eusilc )
##D svypoormed( ~ py010n , design = des_eusilc , na.rm = TRUE )
##D # replicate-weighted design using a variable with missings
##D svypoormed( ~ py010n , design = des_eusilc_rep )
##D svypoormed( ~ py010n , design = des_eusilc_rep , na.rm = TRUE )
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
##D svypoormed( ~ eqincome , design = dbd_eusilc )
##D 
##D dbRemoveTable( conn , 'eusilc' )
##D 
##D dbDisconnect( conn , shutdown = TRUE )
##D 
## End(Not run)




