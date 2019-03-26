library(gdalUtils)


### Name: gdal_cmd_builder
### Title: gdal_cmd_builder
### Aliases: gdal_cmd_builder

### ** Examples

## Not run: 
##D  
##D # This builds a gdal_translate command.
##D executable <- "gdal_translate"
##D 
##D parameter_variables <- list(
##D 			logical = list(
##D 					varnames <- c("strict","unscale","epo",
##D 					"eco","q","sds","stats")),
##D 			vector = list(
##D 					varnames <- c("outsize","scale","srcwin",
##D 					"projwin","a_ullr","gcp")),
##D 			scalar = list(
##D 					varnames <- c("a_nodata")),
##D 			character = list(
##D 					varnames <- c("ot","of","mask","expand","a_srs",
##D 					"src_dataset","dst_dataset")),
##D 			repeatable = list(
##D 					varnames <- c("b","mo","co")))
##D 
##D parameter_order <- c(
##D 			"strict","unscale","epo","eco","q","sds","stats",
##D 			"outsize","scale","srcwin","projwin","a_ullr","gcp",
##D 			"a_nodata",
##D 			"ot","of","mask","expand","a_srs",
##D 			"b","mo","co",
##D 			"src_dataset","dst_dataset")
##D 
##D parameter_noflags <- c("src_dataset","dst_dataset")
##D 
##D # Now assign some parameters:
##D parameter_values = list(
##D 	src_dataset = "input.tif",
##D 	dst_dataset = "output.envi",
##D 	of = "ENVI",
##D 	strict = TRUE
##D )
##D 
##D cmd <- gdal_cmd_builder(
##D 			executable=executable,
##D 			parameter_variables=parameter_variables,
##D 			parameter_values=parameter_values,
##D 			parameter_order=parameter_order,
##D 			parameter_noflags=parameter_noflags)
##D 
##D cmd
##D system(cmd,intern=TRUE) 
## End(Not run)



