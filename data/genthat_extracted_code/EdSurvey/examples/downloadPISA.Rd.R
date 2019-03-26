library(EdSurvey)


### Name: downloadPISA
### Title: Download and Unzips PISA Files
### Aliases: downloadPISA

### ** Examples

## Not run: 
##D # Download PISA 2012 data (for all three databases)
##D downloadPISA(years = 2012, database = c("INT","CBA","FIN"), root="C:/")
##D 
##D # Download PISA 2009 and 2012 data (International Database only) 
##D # to C:/PISA/2009 and C:/PISA/2012 folder respectively
##D downloadPISA(years = c(2009,2012), root="C:/")  
## End(Not run)



