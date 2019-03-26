library(AncestryMapper)


### Name: AncestryMapper
### Title: Ancestry Mapper 2.0
### Aliases: AncestryMapper
### Keywords: package genetic distance ancestry mapping population genetics
###   human ancestry admixture PCA

### ** Examples

## Not run: 
##D library(AncestryMapper)
##D Refs <- system.file ("data", package = "AncestryMapper")
##D 
##D tpeds <- system.file ("extdata", package = "AncestryMapper")
##D 
##D Corpheno <- system.file ("extdata", "CorPheno", package =
##D "AncestryMapper")
##D 
##D All00Frq <- system.file ("data", "MinMaxFreq.rda", package = "AncestryMapper")
##D 
##D genetic.distance <- calculateAMidsArith(pathTotpeds = tpeds,
##D                                          NameOut = "Example",
##D                                          pathToAriMedoids = Refs,
##D                                          pathAll00 = All00Frq)
##D 
##D plotAMids(AMids = genetic.distance, phenoFile = Corpheno, columnPlot = "I")
## End(Not run)



