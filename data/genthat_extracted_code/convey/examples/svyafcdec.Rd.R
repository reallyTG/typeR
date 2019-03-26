library(convey)


### Name: svyafcdec
### Title: Alkire-Foster multidimensional poverty decompostition
### Aliases: svyafcdec svyafcdec.survey.design svyafcdec.svyrep.design
###   svyafcdec.DBIsvydesign
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
svyafcdec( ~ eqincome + hy050n ,  ~1 , des_eusilc , k = .5 , g = 0, cutoffs = cos )
svyafcdec( ~ eqincome + hy050n ,  ~1 , des_eusilc_rep , k = .5 , g = 0, cutoffs = cos )

svyafcdec( ~ eqincome + hy050n ,  ~rb090 , des_eusilc , k = .5 , g = 0, cutoffs = cos )
svyafcdec( ~ eqincome + hy050n ,  ~rb090 , des_eusilc_rep , k = .5 , g = 0, cutoffs = cos )

# subsetting:
sub_des_eusilc <- subset( des_eusilc, db040 == "Styria")
sub_des_eusilc_rep <- subset( des_eusilc_rep, db040 == "Styria")

svyafcdec( ~ eqincome + hy050n ,  ~1 , sub_des_eusilc , k = .5 , g = 0, cutoffs = cos )
svyafcdec( ~ eqincome + hy050n ,  ~1 , sub_des_eusilc_rep , k = .5 , g = 0, cutoffs = cos )

svyafcdec( ~ eqincome + hy050n ,  ~rb090 , sub_des_eusilc ,
k = .5 , g = 0, cutoffs = cos )
svyafcdec( ~ eqincome + hy050n ,  ~rb090 , sub_des_eusilc_rep ,
k = .5 , g = 0, cutoffs = cos )

## Not run: 
##D 
##D # including factor variable with missings
##D cos <- list( 10000, 5000, "EU" )
##D svyafcdec(~eqincome+hy050n+pb220a,  ~1 , des_eusilc,
##D 		k = .5, g = 0, cutoffs = cos , na.rm = FALSE )
##D svyafcdec(~eqincome+hy050n+pb220a,  ~1 , des_eusilc,
##D 		k = .5, g = 0, cutoffs = cos , na.rm = TRUE )
##D svyafcdec(~eqincome+hy050n+pb220a,  ~1 , des_eusilc_rep,
##D 		k = .5, g = 0, cutoffs = cos , na.rm = FALSE )
##D svyafcdec(~eqincome+hy050n+pb220a,  ~1 , des_eusilc_rep,
##D 		k = .5, g = 0, cutoffs = cos , na.rm = TRUE )
##D 
##D svyafcdec(~eqincome+hy050n+pb220a,  ~rb090 , des_eusilc,
##D 		k = .5, g = 0, cutoffs = cos , na.rm = FALSE )
##D svyafcdec(~eqincome+hy050n+pb220a,  ~rb090 , des_eusilc,
##D 		k = .5, g = 0, cutoffs = cos , na.rm = TRUE )
##D svyafcdec(~eqincome+hy050n+pb220a,  ~rb090 , des_eusilc_rep,
##D 		k = .5, g = 0, cutoffs = cos , na.rm = FALSE )
##D svyafcdec(~eqincome+hy050n+pb220a,  ~rb090 , des_eusilc_rep,
##D 		k = .5, g = 0, cutoffs = cos , na.rm = TRUE )
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
##D svyafcdec( ~eqincome+hy050n ,  ~1 , des_eusilc ,
##D k = .5 , g = 0, cutoffs = cos )
##D svyafcdec( ~eqincome+hy050n ,  ~rb090 , des_eusilc ,
##D k = .5 , g = 0, cutoffs = cos )
##D 
##D # subsetting:
##D sub_des_eusilc <- subset( des_eusilc, db040 == "Styria")
##D 
##D svyafcdec( ~ eqincome + hy050n ,  ~1 , sub_des_eusilc ,
##D 		k = .5 , g = 0, cutoffs = cos )
##D 
##D svyafcdec( ~ eqincome + hy050n ,  ~rb090 , sub_des_eusilc ,
##D 		k = .5 , g = 0, cutoffs = cos )
##D 
##D # including factor variable with missings
##D cos <- list( 10000, 5000, "EU" )
##D 
##D svyafcdec(~eqincome+hy050n+pb220a,  ~1 , dbd_eusilc,
##D 		k = .5, g = 0, cutoffs = cos , na.rm = FALSE )
##D svyafcdec(~eqincome+hy050n+pb220a,  ~1 , dbd_eusilc,
##D 		k = .5, g = 0, cutoffs = cos , na.rm = TRUE )
##D 
##D svyafcdec(~eqincome+hy050n+pb220a,  ~rb090 , dbd_eusilc,
##D 		k = .5, g = 0, cutoffs = cos , na.rm = FALSE )
##D svyafcdec(~eqincome+hy050n+pb220a,  ~rb090 , dbd_eusilc,
##D 		k = .5, g = 0, cutoffs = cos , na.rm = TRUE )
##D 
##D dbRemoveTable( conn , 'eusilc' )
##D 
##D dbDisconnect( conn , shutdown = TRUE )
##D 
## End(Not run)




