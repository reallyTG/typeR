library(AncestryMapper)


### Name: calculateAMidsArith
### Title: Calculate genetic distances.
### Aliases: calculateAMidsArith

### ** Examples

## Not run: 
##D Refs <- system.file('data', package = 'AncestryMapper')
##D tpeds <- system.file('extdata', package = 'AncestryMapper')
##D Corpheno <- system.file('extdata', 'CorPheno', package = 'AncestryMapper')
##D All00Frq <- system.file ('data', 'MinMaxFreq.rda', package = 'AncestryMapper')
##D 
##D genetic.distance <- calculateAMidsArith(pathTotpeds = tpeds,
##D                                    NameOut = 'Example',
##D                                    pathToAriMedoids = Refs,
##D                                    pathAll00 = All00Frq)
##D 
##D plotAMids(AMids = genetic.distance, phenoFile = Corpheno, columnPlot = "I")
## End(Not run)



