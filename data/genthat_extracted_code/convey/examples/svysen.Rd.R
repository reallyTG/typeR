library(convey)


### Name: svysen
### Title: Sen (1976) poverty index (EXPERIMENTAL)
### Aliases: svysen svysen.survey.design svysen.svyrep.design
###   svysen.DBIsvydesign
### Keywords: survey

### ** Examples

library(survey)
library(vardpoor)
data(eusilc) ; names( eusilc ) <- tolower( names( eusilc ) )

# linearized design

des_eusilc <- svydesign( ids = ~rb030 , strata = ~db040 ,  weights = ~rb050 , data = eusilc )
des_eusilc <- convey_prep( des_eusilc )

# replicate-weighted design
des_eusilc_rep <- as.svrepdesign( des_eusilc , type = "bootstrap" )
des_eusilc_rep <- convey_prep( des_eusilc_rep )

# using linearized design
svysen( ~eqincome, des_eusilc, abs_thresh=10000 )

# using replicate design:
svysen( ~eqincome, des_eusilc_rep, abs_thresh = 10000 )


## Not run: 
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
##D 
##D dbd_eusilc <- convey_prep( dbd_eusilc )
##D 
##D # linearized SE:
##D svysen(~eqincome, dbd_eusilc, abs_thresh=10000)
##D 
##D dbRemoveTable( conn , 'eusilc' )
##D 
##D dbDisconnect( conn , shutdown = TRUE )
##D 
## End(Not run)




