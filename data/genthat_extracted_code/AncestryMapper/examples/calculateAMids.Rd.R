library(AncestryMapper)


### Name: calculateAMids
### Title: Calculate genetic distances.
### Aliases: calculateAMids

### ** Examples

## Not run: 
##D library(AncestryMapper)
##D 
##D HGDP_References <- system.file('extdata',
##D                                'HGDP_References.txt',
##D                                 package = 'AncestryMapper')
##D 
##D 
##D HGDP_500SNPs <- system.file('extdata',
##D                             'HGDP_500SNPs.ped',
##D                              package = 'AncestryMapper')
##D 
##D Corpheno <- system.file('extdata',
##D                         'CorPheno',
##D                          package = 'AncestryMapper')
##D 
##D genetic.distance <- calculateAMids(pedtxtFile = HGDP_500SNPs,
##D                                    fileReferences = HGDP_References)
##D 
##D plotAMids(AMids = genetic.distance, phenoFile = Corpheno, columnPlot = "I")
## End(Not run)



