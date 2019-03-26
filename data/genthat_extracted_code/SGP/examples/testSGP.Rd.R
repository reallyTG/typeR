library(SGP)


### Name: testSGP
### Title: Test SGP Package functions
### Aliases: testSGP
### Keywords: documentation

### ** Examples

## Not run: 
##D ## testSGP(0): Test of studentGrowthPercentiles, studentGrowthProjections, and sgpData
##D testSGP(0)
##D 
##D ## testSGP(1) & testSGP('1b') runs abcSGP for all years in sgpData_LONG with/without sqliteSGP
##D testSGP(1) 
##D testSGP('1b')
##D 
##D ## testSGP(2): Various tests of updateSGP functionality.
##D ## testSGP('2a'): Test of updateSGP performing SGP analyses in two steps: 
##D ##	Create what_sgp_object: 2010-2011 to 2013-2014 then add with_sgp_data_LONG 2014-2015 using
##D ##	overwrite.existing.data=FALSE and sgp.use.my.coefficient.matrices=FALSE.
##D ## testSGP('2b'): Test of updateSGP performing SGP analyses in two steps: 
##D ## 	Create what_sgp_object: 2010-2011 to 2013-2014 then add with_sgp_data_LONG 2014-2015 using
##D ##	overwrite.existing.data=TRUE and sgp.use.my.coefficient.matrices=FALSE.
##D ## testSGP('2c'): Test of updateSGP performing SGP analyses in two steps:
##D ##	Create what_sgp_object: 2010-2011 to 2013-2014 then add with_sgp_data_LONG 2014-2015 using
##D ##	overwrite.existing.data=TRUE and sgp.use.my.coefficient.matrices=TRUE.
##D ## testSGP('2d'): Test of updateSGP performing SGP analyses in two steps:
##D ##	Create what_sgp_object: 2010-2011 to 2013-2014 then add with_sgp_data_LONG 2014-2015 using
##D ##	overwrite.existing.data=FALSE and sgp.use.my.coefficient.matrices=TRUE.
##D testSGP('2a')
##D testSGP('2b')
##D testSGP('2c')
##D testSGP('2d')
##D 
##D ## testSGP(3) runs abcSGP on grade progressions including End of Course Tests in Mathematics 
##D ## (Algebra I and Algebra II) and Reading (Grade 9 Literature and American Literature)
##D testSGP(3)
##D 
##D ## testSGP(4) runs prepareSGP and analyzeSGP with simex adjustment for measurement error
##D testSGP(4)
##D 
##D ## testSGP(5) runs abcSGP assuming at test transition in the most recent year. NOTE YET COMPLETED
##D testSGP(5)
##D 
##D ## testSGP(6) runs a basic baseline SGP analysis including the construction of baseline matrices.
##D testSGP(6)
## End(Not run)  



