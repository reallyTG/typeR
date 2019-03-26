library(MSnID)


### Name: MSnID-class
### Title: The "MSnID" Class for Mass Spectrometry Based Proteomics
###   Identification Data
### Aliases: MSnID-class class:MSnID MSnID dim,MSnID-method
###   names,MSnID-method show,MSnID-method $,MSnID-method $<-,MSnID-method
###   [[,MSnID-method [[,MSnID,ANY,ANY-method [[<-,MSnID-method
###   assess_missed_cleavages,MSnID-method assess_termini,MSnID-method
###   correct_peak_selection,MSnID-method evaluate_filter,MSnID-method
###   peptides,MSnID-method accessions,MSnID-method proteins,MSnID-method
###   id_quality,MSnID-method mass_measurement_error,MSnID-method
###   read_mzIDs,MSnID-method recalibrate,MSnID-method psms,MSnID-method
###   psms<-,MSnID,data.frame-method coerce,MSnID,MSnSet-method
###   coerce,MSnID,data.table-method
### Keywords: classes

### ** Examples

## Not run: 
##D msnidObj <- MSnID(".")
##D mzids <- system.file("extdata","c_elegans.mzid.gz",package="MSnID")
##D msnidObj <- read_mzIDs(msnidObj, mzids)
##D # clean up the cache directory
##D unlink(".Rcache", recursive=TRUE)
## End(Not run)



