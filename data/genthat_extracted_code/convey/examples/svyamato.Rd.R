library(convey)


### Name: svyamato
### Title: Amato index (EXPERIMENTAL)
### Aliases: svyamato svyamato.survey.design svyamato.svyrep.design
###   svyamato.DBIsvydesign
### Keywords: survey

### ** Examples

library(survey)
library(vardpoor)
data(eusilc) ; names( eusilc ) <- tolower( names( eusilc ) )

# linearized design
des_eusilc <- svydesign( ids = ~rb030 , strata = ~db040 ,  weights = ~rb050 , data = eusilc )
des_eusilc <- convey_prep(des_eusilc)

# replicate-weighted design
des_eusilc_rep <- as.svrepdesign( des_eusilc , type = "bootstrap" )
des_eusilc_rep <- convey_prep(des_eusilc_rep)


# variable without missing values
svyamato(~eqincome, des_eusilc)
svyamato(~eqincome, des_eusilc_rep)

# subsetting:
svyamato(~eqincome, subset( des_eusilc, db040 == "Styria"))
svyamato(~eqincome, subset( des_eusilc_rep, db040 == "Styria"))

## Not run: 
##D 
##D # variable with with missings
##D svyamato(~py010n, des_eusilc )
##D svyamato(~py010n, des_eusilc_rep )
##D 
##D svyamato(~py010n, des_eusilc, na.rm = TRUE )
##D svyamato(~py010n, des_eusilc_rep, na.rm = TRUE )
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
##D 
##D # variable without missing values
##D svyamato(~eqincome, dbd_eusilc)
##D 
##D # subsetting:
##D svyamato(~eqincome, subset( dbd_eusilc, db040 == "Styria"))
##D 
##D # variable with with missings
##D svyamato(~py010n, dbd_eusilc )
##D 
##D svyamato(~py010n, dbd_eusilc, na.rm = TRUE )
##D 
##D 
##D dbRemoveTable( conn , 'eusilc' )
##D 
##D dbDisconnect( conn , shutdown = TRUE )
##D 
## End(Not run)




