library(AmigaFFH)


### Name: rawToSysConfig
### Title: Coerce raw data into a SysConfig class object
### Aliases: rawToSysConfig

### ** Examples

## Not run: 
##D ## get the system-configuration from the adfExplorer example disk:
##D sc <- adfExplorer::get.adf.file(adfExplorer::adf.example, "devs/system-configuration")
##D 
##D ## This will get you the raw data from the file:
##D typeof(sc)
##D 
##D ## Convert the raw data to a more comprehensive named list (and S3 SysConfig class):
##D sc <- rawToSysConfig(sc)
## End(Not run)



