library(minval)


### Name: writeSBMLmod
### Title: Write a model in SBML format
### Aliases: writeSBMLmod

### ** Examples

# Loading a metabolic model
glycolysis <- read.csv(system.file("extdata/glycolysisModel.csv",package = "minval"), sep='\t')

# Writing a model in SBML format
writeSBMLmod(modelData = glycolysis,modelID = "Glycolysis",outputFile = "glycolysis.xml")

## Not run: 
##D # Writing a modelOrg object in a SBML format
##D ## Loading the sybil R package
##D library(sybil)
##D 
##D ## Loading the data
##D data("Ec_core")
##D 
##D ## Writing the modelOrg object in a SBML format
##D writeSBMLmod(modelData = Ec_core,modelID = "E.coli",outputFile = "eColi.xml")
## End(Not run)



