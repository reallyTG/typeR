library(MSnbase)


### Name: MzTab-class
### Title: Parse 'MzTab' files
### Aliases: MzTab-class class:MzTab MzTab metadata,MzTab-method
###   fileName,MzTab-method fileNames,MzTab-method peptides,MzTab-method
###   proteins,MzTab-method psms,MzTab-method comments smallMolecules
###   mzTabMode mzTabType coerce,MzTab,MSnSetList-method show,MzTab-method
### Keywords: classes

### ** Examples

## Test files from the mzTab developement repository
fls <- c("Cytidine.mzTab", "MTBLS2.mztab", 
         "PRIDE_Exp_Complete_Ac_1643.xml-mztab.txt", 
         "PRIDE_Exp_Complete_Ac_16649.xml-mztab.txt", 
         "SILAC_CQI.mzTab", "SILAC_SQ.mzTab", 
         "iTRAQ_CQI.mzTab", "iTRAQ_SQI.mzTab", 
         "labelfree_CQI.mzTab", "labelfree_SQI.mzTab", 
         "lipidomics-HFD-LD-study-PL-DG-SM.mzTab", 
         "lipidomics-HFD-LD-study-TG.mzTab")

baseUrl <- "https://raw.githubusercontent.com/HUPO-PSI/mzTab/master/examples/1_0-Proteomics-Release/"

## a list of mzTab objects
mzt <- sapply(file.path(baseUrl, fls), MzTab)
stopifnot(length(mzt) == length(fls))
mzt[[4]]

dim(proteins(mzt[[4]]))
dim(psms(mzt[[4]]))

prots4 <- proteins(mzt[[4]])
class(prots4)
prots4[1:5, 1:4]



