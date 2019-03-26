library(sampleSelection)


### Name: nlswork
### Title: National Longitudinal Survey of Young Working Women
### Aliases: nlswork
### Keywords: datasets

### ** Examples

data( "nlswork" )
summary( nlswork )

## Not run: 
##D library( "plm" )
##D nlswork <- plm.data( nlswork, c( "idcode", "year" ) )
##D plmResult <- plm( ln_wage ~ union + age + grade + not_smsa + south + occ_code,
##D    data = nlswork, model = "random" )
##D summary( plmResult )
## End(Not run)



