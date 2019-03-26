library(polyRAD)


### Name: AddAlleleLinkages
### Title: Identify and Utilize Linked Alleles for Estimating Genotype
###   Priors
### Aliases: AddAlleleLinkages AddAlleleLinkages.RADdata
###   AddGenotypePriorProb_LD AddGenotypePriorProb_LD.RADdata
### Keywords: array regression

### ** Examples

# load example dataset
data(Msi01genes)

# Run non-LD pop structure pipeline
Msi01genes <- IteratePopStruct(Msi01genes, tol = 0.01, nPcsInit = 10)

# Add linkages
Msi01genes <- AddAlleleLinkages(Msi01genes, "popstruct", 1e4, 0.05)
# Get new posterior probabilities based on those linkages
Msi01genes <- AddGenotypePriorProb_LD(Msi01genes, "popstruct")

# Preview results
Msi01genes$priorProbLD[[1]][,1:10,1:10]



