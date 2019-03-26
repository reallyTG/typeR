library(pccc)


### Name: pccc-package
### Title: pccc: Pediatric Complex Chronic Conditions
### Aliases: pccc-package

### ** Examples

## Not run: 
##D # To open the Feudtner et.al. pdf from within R use the following
##D if (!is.null(getOption("pdfviewer"))) {
##D   system(paste0(getOption("pdfviewer"), " ",
##D                 file.path(system.file("pccc_references", package = "pccc")), "/",
##D                 "Feudtner_etal_2014.pdf"))
##D }
##D 
##D # If the pdf cannot be opened, you should be able to open it manually by
##D # navagating to
##D file.path(system.file("pccc_references", package = "pccc"))
##D 
##D # To view the original SAS program
##D file.show(system.file("pccc_references", "ccc_version2_sas.sas", package = "pccc"))
##D 
##D # To view the original STATA program
##D file.show(system.file("pccc_references", "ccc.do", package = "pccc"))
## End(Not run)




