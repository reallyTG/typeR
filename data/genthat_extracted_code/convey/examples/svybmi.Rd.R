library(convey)


### Name: svybmi
### Title: Bourguignon (1999) multidimensional inequality indices
###   (EXPERIMENTAL)
### Aliases: svybmi svybmi.survey.design svybmi.svyrep.design
###   svybmi.DBIsvydesign
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
des_eusilc_rep <- as.svrepdesign( des_eusilc , type = "bootstrap", replicates = 50 )
des_eusilc_rep <- convey_prep(des_eusilc_rep)

# linearized
svybmi(~eqincome+hy050n, design = des_eusilc, alpha = .5, beta = .5, na.rm = FALSE )
svybmi(~eqincome+hy050n, design = des_eusilc, alpha = .5, beta = 0, na.rm = FALSE )
svybmi(~eqincome+hy050n, design = des_eusilc, alpha = .5, beta = -.5, na.rm = FALSE )
svybmi(~eqincome+hy050n, design = des_eusilc, alpha = .5, beta = -1, na.rm = FALSE )
svybmi(~eqincome+hy050n, design = des_eusilc, alpha = .5, beta = -2, na.rm = FALSE )

# replicate
svybmi(~eqincome+hy050n, design = des_eusilc_rep, alpha = .5, beta = .5, na.rm = FALSE )
svybmi(~eqincome+hy050n, design = des_eusilc_rep, alpha = .5, beta = 0, na.rm = FALSE )
svybmi(~eqincome+hy050n, design = des_eusilc_rep, alpha = .5, beta = -.5, na.rm = FALSE )
svybmi(~eqincome+hy050n, design = des_eusilc_rep, alpha = .5, beta = -1, na.rm = FALSE )
svybmi(~eqincome+hy050n, design = des_eusilc_rep, alpha = .5, beta = -2, na.rm = FALSE )

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
##D dbd_eusilc <- convey_prep( dbd_eusilc )
##D 
##D # linearized
##D svybmi(~eqincome+hy050n, design = dbd_eusilc, alpha = .5, beta = .5, na.rm = FALSE )
##D svybmi(~eqincome+hy050n, design = dbd_eusilc, alpha = .5, beta = 0, na.rm = FALSE )
##D svybmi(~eqincome+hy050n, design = dbd_eusilc, alpha = .5, beta = -.5, na.rm = FALSE )
##D svybmi(~eqincome+hy050n, design = dbd_eusilc, alpha = .5, beta = -1, na.rm = FALSE )
##D svybmi(~eqincome+hy050n, design = dbd_eusilc, alpha = .5, beta = -2, na.rm = FALSE )
##D 
##D # subsetting:
##D sub_dbd_eusilc <- subset( dbd_eusilc, db040 == "Styria")
##D svybmi(~eqincome+hy050n, design = sub_dbd_eusilc, alpha = .5, beta = .5, na.rm = FALSE )
##D 
##D dbRemoveTable( conn , 'eusilc' )
##D 
##D dbDisconnect( conn , shutdown = TRUE )
##D 
## End(Not run)




