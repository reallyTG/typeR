library(convey)


### Name: svygei
### Title: Generalized entropy index
### Aliases: svygei svygei.survey.design svygei.svyrep.design
###   svygei.DBIsvydesign
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
svygei( ~eqincome , subset(des_eusilc, eqincome > 0), epsilon = 0 )
svygei( ~eqincome , subset(des_eusilc, eqincome > 0), epsilon = .5 )
svygei( ~eqincome , subset(des_eusilc, eqincome > 0), epsilon = 1 )
svygei( ~eqincome , subset(des_eusilc, eqincome > 0), epsilon = 2 )

# replicate-weighted design
svygei( ~eqincome , subset(des_eusilc_rep, eqincome > 0), epsilon = 0 )
svygei( ~eqincome , subset(des_eusilc_rep, eqincome > 0), epsilon = .5 )
svygei( ~eqincome , subset(des_eusilc_rep, eqincome > 0), epsilon = 1 )
svygei( ~eqincome , subset(des_eusilc_rep, eqincome > 0), epsilon = 2 )

## Not run: 
##D 
##D # linearized design using a variable with missings
##D svygei( ~py010n , subset(des_eusilc, py010n > 0 | is.na(py010n) ), epsilon = 0 )
##D svygei( ~py010n , subset(des_eusilc, py010n > 0 | is.na(py010n) ), epsilon = 0, na.rm = TRUE )
##D svygei( ~py010n , subset(des_eusilc, py010n > 0 | is.na(py010n) ), epsilon = .5 )
##D svygei( ~py010n , subset(des_eusilc, py010n > 0 | is.na(py010n) ), epsilon = .5, na.rm = TRUE )
##D svygei( ~py010n , subset(des_eusilc, py010n > 0 | is.na(py010n) ), epsilon = 1 )
##D svygei( ~py010n , subset(des_eusilc, py010n > 0 | is.na(py010n) ), epsilon = 1, na.rm = TRUE )
##D svygei( ~py010n , subset(des_eusilc, py010n > 0 | is.na(py010n) ), epsilon = 2 )
##D svygei( ~py010n , subset(des_eusilc, py010n > 0 | is.na(py010n) ), epsilon = 2, na.rm = TRUE )
##D 
##D # replicate-weighted design using a variable with missings
##D svygei( ~py010n , subset(des_eusilc_rep, py010n > 0 | is.na(py010n) ), epsilon = 0 )
##D svygei( ~py010n , subset(des_eusilc_rep, py010n > 0 | is.na(py010n) ), epsilon = 0, na.rm = TRUE )
##D svygei( ~py010n , subset(des_eusilc_rep, py010n > 0 | is.na(py010n) ), epsilon = .5 )
##D svygei( ~py010n , subset(des_eusilc_rep, py010n > 0 | is.na(py010n) ), epsilon = .5, na.rm = TRUE )
##D svygei( ~py010n , subset(des_eusilc_rep, py010n > 0 | is.na(py010n) ), epsilon = 1 )
##D svygei( ~py010n , subset(des_eusilc_rep, py010n > 0 | is.na(py010n) ), epsilon = 1, na.rm = TRUE )
##D svygei( ~py010n , subset(des_eusilc_rep, py010n > 0 | is.na(py010n) ), epsilon = 2 )
##D svygei( ~py010n , subset(des_eusilc_rep, py010n > 0 | is.na(py010n) ), epsilon = 2, na.rm = TRUE )
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
##D svygei( ~eqincome , subset(dbd_eusilc, eqincome > 0), epsilon = 0 )
##D svygei( ~eqincome , dbd_eusilc, epsilon = .5 )
##D svygei( ~eqincome , subset(dbd_eusilc, eqincome > 0), epsilon = 1 )
##D svygei( ~eqincome , dbd_eusilc, epsilon = 2 )
##D 
##D # database-backed linearized design using a variable with missings
##D svygei( ~py010n , subset(dbd_eusilc, py010n > 0 | is.na(py010n) ), epsilon = 0 )
##D svygei( ~py010n , subset(dbd_eusilc, py010n > 0 | is.na(py010n) ), epsilon = 0, na.rm = TRUE )
##D svygei( ~py010n , dbd_eusilc, epsilon = .5 )
##D svygei( ~py010n , dbd_eusilc, epsilon = .5, na.rm = TRUE )
##D svygei( ~py010n , subset(dbd_eusilc, py010n > 0 | is.na(py010n) ), epsilon = 1 )
##D svygei( ~py010n , subset(dbd_eusilc, py010n > 0 | is.na(py010n) ), epsilon = 1, na.rm = TRUE )
##D svygei( ~py010n , dbd_eusilc, epsilon = 2 )
##D svygei( ~py010n , dbd_eusilc, epsilon = 2, na.rm = TRUE )
##D 
##D dbRemoveTable( conn , 'eusilc' )
##D 
##D dbDisconnect( conn , shutdown = TRUE )
##D 
## End(Not run)




