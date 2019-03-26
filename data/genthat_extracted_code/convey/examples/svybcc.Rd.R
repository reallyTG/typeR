library(convey)


### Name: svybcc
### Title: Bourguignon-Chakravarty multidimensional poverty class
###   (EXPERIMENTAL)
### Aliases: svybcc svybcc.survey.design svybcc.svyrep.design
###   svybcc.DBIsvydesign
### Keywords: survey

### ** Examples

library(survey)
library(vardpoor)
data(eusilc) ; names( eusilc ) <- tolower( names( eusilc ) )

# linearized design
des_eusilc <- svydesign( ids = ~rb030 , strata = ~db040 ,  weights = ~rb050 , data = eusilc )
des_eusilc <- convey_prep(des_eusilc)
des_eusilc <- update(des_eusilc, pb220a = ordered( pb220a ) )

# replicate-weighted design
des_eusilc_rep <- as.svrepdesign( des_eusilc , type = "bootstrap" )
des_eusilc_rep <- convey_prep(des_eusilc_rep)

# cutoffs
cos <- list( 10000, 5000 )

# variables without missing values
svybcc( ~ eqincome + hy050n , design = des_eusilc , cutoffs = cos )
svybcc( ~ eqincome + hy050n , design = des_eusilc_rep , cutoffs = cos )

# subsetting:
sub_des_eusilc <- subset( des_eusilc, db040 == "Styria")
sub_des_eusilc_rep <- subset( des_eusilc_rep, db040 == "Styria")

svybcc( ~ eqincome + hy050n , design = sub_des_eusilc , cutoffs = cos )
svybcc( ~ eqincome + hy050n , design = sub_des_eusilc_rep , cutoffs = cos )

## Not run: 
##D 
##D # including factor variable with missings
##D cos <- list( 10000, 5000, "EU" )
##D svybcc(~eqincome+hy050n+pb220a, des_eusilc, cutoffs = cos, na.rm = FALSE )
##D svybcc(~eqincome+hy050n+pb220a, des_eusilc, cutoffs = cos, na.rm = TRUE )
##D svybcc(~eqincome+hy050n+pb220a, des_eusilc_rep, cutoffs = cos, na.rm = FALSE )
##D svybcc(~eqincome+hy050n+pb220a, des_eusilc_rep, cutoffs = cos, na.rm = TRUE )
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
##D dbd_eusilc <- update( dbd_eusilc, pb220a = ordered( pb220a ) )
##D 
##D # cutoffs
##D cos <- list( 10000 , 5000 )
##D 
##D # variables without missing values
##D svybcc(~eqincome+hy050n, design = dbd_eusilc, cutoffs = cos )
##D 
##D # subsetting:
##D sub_dbd_eusilc <- subset( dbd_eusilc, db040 == "Styria")
##D svybcc(~eqincome+hy050n, design = sub_dbd_eusilc, cutoffs = cos )
##D 
##D # cutoffs
##D cos <- list( 10000, 5000, "EU" )
##D 
##D # including factor variable with missings
##D svybcc(~eqincome+hy050n+pb220a, dbd_eusilc, cutoffs = cos, na.rm = FALSE )
##D svybcc(~eqincome+hy050n+pb220a, dbd_eusilc, cutoffs = cos, na.rm = TRUE )
##D 
##D dbRemoveTable( conn , 'eusilc' )
##D 
##D dbDisconnect( conn , shutdown = TRUE )
##D 
## End(Not run)




