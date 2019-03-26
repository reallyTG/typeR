library(EdSurvey)


### Name: readECLS_K1998
### Title: Connect to ECLS-K 1998 Data
### Aliases: readECLS_K1998

### ** Examples

## Not run: 
##D #read-in student file with defaults
##D eclsk_df <- readECLS_K1998(path="C:/ECLS_K/1998") #using defaults
##D d <- getData(eclsk_df, c("childid", "gender", "race"))
##D summary(d)
##D 
##D #read-in with parameters specified
##D eclsk_df <- readECLS_K1998(path = "C:/ECLS_K1998", 
##D                            filename = "eclsk_98_99_k8_child_v1_0.dat", 
##D                            layoutFilename = "Layout_k8_child.txt", 
##D                            verbose = TRUE, 
##D                            forceReread = FALSE)
## End(Not run)



