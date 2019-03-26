library(minval)


### Name: writeTSVmod
### Title: Write a model in TSV format for the 'sybil' R package
### Aliases: writeTSVmod

### ** Examples

#' # Loading a metabolic model
glycolysis <- read.csv(system.file("extdata/glycolysisModel.csv",package = "minval"), sep='\t')

# Writing a model in TSV format
writeTSVmod(modelData = glycolysis,modelID = "Glycolysis",outputFile = "glycolysis")

## Not run: 
##D # Writing a modelOrg object in a SBML format
##D ## Loading the sybil R package
##D library(sybil)
##D 
##D ## Loading the data
##D data("Ec_core")
##D 
##D ## Writing the modelOrg object in a SBML format
##D writeTSVmod(modelData = Ec_core,modelID = "E.coli",outputFile = "eColi")
## End(Not run)



