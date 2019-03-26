library(convey)


### Name: svyrenyi
### Title: Renyi divergence measure (EXPERIMENTAL)
### Aliases: svyrenyi svyrenyi.survey.design svyrenyi.svyrep.design
###   svyrenyi.DBIsvydesign
### Keywords: survey

### ** Examples

library(survey)
library(vardpoor)
data(eusilc) ; names( eusilc ) <- tolower( names( eusilc ) )

# linearized design
des_eusilc <- svydesign( ids = ~rb030 , strata = ~db040 ,  weights = ~rb050 , data = eusilc )
des_eusilc <- convey_prep(des_eusilc)

svyrenyi( ~eqincome , design = des_eusilc, epsilon = .5 )

# replicate-weighted design
des_eusilc_rep <- as.svrepdesign( des_eusilc , type = "bootstrap" )
des_eusilc_rep <- convey_prep(des_eusilc_rep)

svyrenyi( ~eqincome , design = des_eusilc_rep, epsilon = .5 )

## Not run: 
##D 
##D # linearized design using a variable with missings
##D svyrenyi( ~py010n , design = des_eusilc, epsilon = .5 )
##D svyrenyi( ~py010n , design = des_eusilc, epsilon = .5, na.rm = TRUE )
##D # replicate-weighted design using a variable with missings
##D svyrenyi( ~py010n , design = des_eusilc_rep, epsilon = .5 )
##D svyrenyi( ~py010n , design = des_eusilc_rep, epsilon = .5, na.rm = TRUE )
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
##D svyrenyi( ~eqincome , design = dbd_eusilc, epsilon = .5 )
##D 
##D # Testing if Renyi and GEI match when epsilon == 1:
##D svyrenyi( ~eqincome , design = subset(dbd_eusilc, eqincome > 0 ), epsilon = 1 )
##D svygei( ~eqincome , design = subset(dbd_eusilc, eqincome > 0 ), epsilon = 1 )
##D 
##D dbRemoveTable( conn , 'eusilc' )
##D 
##D dbDisconnect( conn , shutdown = TRUE )
##D 
## End(Not run)




