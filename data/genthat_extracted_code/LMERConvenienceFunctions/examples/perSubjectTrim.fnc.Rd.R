library(LMERConvenienceFunctions)


### Name: perSubjectTrim.fnc
### Title: Per-subject Trimming of Response Variable.
### Aliases: perSubjectTrim.fnc
### Keywords: manip

### ** Examples

## Not run: 
##D if("LCFdata" %in% .packages(all.available=TRUE)){
##D data(eegWide)
##D dat<-eegWide
##D rm(eegWide)
##D gc(TRUE,TRUE)
##D # per subject trimming
##D dat <- perSubjectTrim.fnc(dat, response = "Fz", 
##D       subject = "Subject", trim = 2.5)$data
##D # ......
##D # n.removed = 5130 
##D # percent.removed = 1.584507 
##D }
## End(Not run)



