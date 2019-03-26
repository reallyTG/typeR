library(convey)


### Name: svyjdivdec
### Title: J-Divergence Decomposition (EXPERIMENTAL)
### Aliases: svyjdivdec svyjdivdec.survey.design svyjdivdec.svyrep.design
###   svyjdivdec.DBIsvydesign
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

# linearized design
svyjdivdec( ~eqincome , ~rb090 , subset(des_eusilc, eqincome > 0) )

# replicate-weighted design
svyjdivdec( ~eqincome , ~rb090 , subset(des_eusilc_rep, eqincome > 0) )

## Not run: 
##D 
##D # linearized design using a variable with missings
##D sub_des_eusilc <- subset(des_eusilc, py010n > 0 | is.na(py010n) )
##D svyjdivdec( ~py010n , ~rb090 , sub_des_eusilc )
##D svyjdivdec( ~py010n , ~rb090 , sub_des_eusilc , na.rm = TRUE )
##D 
##D # replicate-weighted design using a variable with missings
##D sub_des_eusilc_rep <- subset(des_eusilc_rep, py010n > 0 | is.na(py010n) )
##D svyjdivdec( ~py010n , ~rb090 , sub_des_eusilc_rep )
##D svyjdivdec( ~py010n , ~rb090 , sub_des_eusilc_rep , na.rm = TRUE )
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
##D # database-backed linearized design
##D svyjdivdec( ~eqincome , ~rb090 , subset(dbd_eusilc, eqincome > 0) )
##D 
##D # database-backed linearized design using a variable with missings
##D sub_dbd_eusilc <- subset(dbd_eusilc, py010n > 0 | is.na(py010n) )
##D svyjdivdec( ~py010n , ~rb090 , sub_dbd_eusilc )
##D svyjdivdec( ~py010n , ~rb090 , sub_dbd_eusilc , na.rm = TRUE )
##D 
##D dbRemoveTable( conn , 'eusilc' )
##D 
##D dbDisconnect( conn , shutdown = TRUE )
##D 
## End(Not run)




