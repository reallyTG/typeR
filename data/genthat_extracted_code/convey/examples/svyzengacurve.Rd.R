library(convey)


### Name: svyzengacurve
### Title: Zenga inequality curve (EXPERIMENTAL)
### Aliases: svyzengacurve svyzengacurve.survey.design
###   svyzengacurve.svyrep.design svyzengacurve.DBIsvydesign
### Keywords: survey

### ** Examples


library(survey)
library(vardpoor)
data(eusilc) ; names( eusilc ) <- tolower( names( eusilc ) )

# linearized design
des_eusilc <- svydesign( ids = ~rb030 , strata = ~db040 ,  weights = ~rb050 , data = eusilc )
des_eusilc <- convey_prep( des_eusilc )
svyzengacurve( ~eqincome , des_eusilc,  alpha = .01 )

# replicate-weighted design
des_eusilc_rep <- as.svrepdesign( des_eusilc , type = "bootstrap" )
des_eusilc_rep <- convey_prep( des_eusilc_rep )

svyzengacurve( ~eqincome , des_eusilc_rep,  alpha = .01 )

## Not run: 
##D 
##D # linearized design using a variable with missings
##D svyzengacurve( ~py010n , des_eusilc, alpha = .01 )
##D svyzengacurve( ~py010n , des_eusilc, alpha = .01, na.rm = TRUE )
##D # demonstration of `curve.col=` and `add=` parameters
##D svyzengacurve( ~eqincome , des_eusilc,  alpha = .05 , add = TRUE , curve.col = 'green' )
##D # replicate-weighted design using a variable with missings
##D svyzengacurve( ~py010n , des_eusilc_rep, alpha = .01 )
##D svyzengacurve( ~py010n , des_eusilc_rep, alpha = .01, na.rm = TRUE )
##D 
##D 
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
##D svyzengacurve( ~eqincome , dbd_eusilc, alpha = .01 )
##D 
##D # highlighting the difference between the quantile-based curve and the empirical version:
##D svyzengacurve( ~eqincome , dbd_eusilc, seq(0,1,.1), empirical = TRUE, curve.col = "green" )
##D svyzengacurve( ~eqincome , dbd_eusilc, seq(0,1,.1), alpha = .01, add = TRUE )
##D legend( "bottomleft", c("Quantile-based", "Empirical"), lwd = c(1,1), col = c("red", "green"))
##D 
##D # as the number of quantiles increases, the difference between the curves gets smaller
##D svyzengacurve( ~eqincome , dbd_eusilc, seq(0,1,.01), empirical = TRUE, curve.col = "green" )
##D svyzengacurve( ~eqincome , dbd_eusilc, seq(0,1,.01), alpha = .01, add = TRUE )
##D legend( "bottomleft", c("Quantile-based", "Empirical"), lwd = c(1,1), col = c("red", "green"))
##D 
##D dbRemoveTable( conn , 'eusilc' )
##D 
##D dbDisconnect( conn , shutdown = TRUE )
##D 
## End(Not run)




