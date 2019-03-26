library(convey)


### Name: svyiqalpha
### Title: Linearization of a variable quantile
### Aliases: svyiqalpha svyiqalpha.survey.design svyiqalpha.svyrep.design
###   svyiqalpha.DBIsvydesign
### Keywords: survey

### ** Examples


library(vardpoor)
data(eusilc) ; names( eusilc ) <- tolower( names( eusilc ) )
library(survey)
# linearized design
des_eusilc <- svydesign( ids = ~rb030 , strata = ~db040 ,  weights = ~rb050 , data = eusilc )
des_eusilc <- convey_prep(des_eusilc)

svyiqalpha( ~eqincome , design = des_eusilc, .50 )

# replicate-weighted design
des_eusilc_rep <- as.svrepdesign( des_eusilc , type = "bootstrap" )
des_eusilc_rep <- convey_prep(des_eusilc_rep)

svyiqalpha( ~eqincome , design = des_eusilc_rep, .50 )

## Not run: 
##D 
##D # linearized design using a variable with missings
##D svyiqalpha( ~ py010n , design = des_eusilc, .50 )
##D svyiqalpha( ~ py010n , design = des_eusilc , .50, na.rm = TRUE )
##D # replicate-weighted design using a variable with missings
##D svyiqalpha( ~ py010n , design = des_eusilc_rep, .50 )
##D svyiqalpha( ~ py010n , design = des_eusilc_rep ,.50, na.rm = TRUE )
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
##D svyiqalpha( ~ eqincome , design = dbd_eusilc, .50 )
##D 
##D dbRemoveTable( conn , 'eusilc' )
##D 
##D dbDisconnect( conn , shutdown = TRUE )
##D 
## End(Not run)




