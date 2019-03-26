library(mQTL)


### Name: format_mQTL
### Title: Routine to reformat the data into the required format
### Aliases: format_mQTL
### Keywords: function

### ** Examples

  ## Not run: 
##D ## Clean the raw data to match the genotype and phenotype and create the proper format
##D 
##D   rawfile<-"MetaboFile.dat" ## Metabolomic data file
##D   genofile<-"GenoFile.dat" ## Genotype data file
##D   physiodat="physiodat.dat" ## data file containing sex and pgm 
##D   cleandat<-"CleanMetaboFile.dat" ## Metabolomic data file in csvs format
##D   cleangen<-"CleanGenoFile.dat" ## Genotype data file in csvs format
##D 
##D   format_mQTL(rawfile,genofile,physiodat, cleandat,cleangen)
## End(Not run)



