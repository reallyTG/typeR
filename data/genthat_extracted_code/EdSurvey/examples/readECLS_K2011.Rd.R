library(EdSurvey)


### Name: readECLS_K2011
### Title: Connect to ECLS-K 2011 Data
### Aliases: readECLS_K2011

### ** Examples

## Not run: 
##D #read-in student file with defaults
##D eclsk_df <- readECLS_K2011(path="C:/ECLS_K/2011") #using defaults
##D d <- getData(eclsk_df, c("childid", "c1hgt1", "c1wgt1"))
##D summary(d)
##D 
##D #read-in with parameters specified
##D eclsk_df <- readECLS_K2011(path = "C:/ECLS_K2011",
##D                            filename = "childK4p.dat",
##D                            layoutFilename = "ECLSK2011_K4PUF.sps",
##D                            forceReread = FALSE,
##D                            verbose = TRUE) 
## End(Not run)



