library(VLF)


### Name: concordanceFun
### Title: VLF Concordance Check Function
### Aliases: concordanceFun

### ** Examples

## Not run: 
##D #VLF analysis
##D data(birds)
##D bird_vlfAnalysis <- vlfFun(birds)
##D 
##D #Amino Acid analysis
##D data(birds_aminoAcids)
##D bird_aaAnalysis <- aminoAcidFun(birds_aminoAcids)
##D 
##D #Concordance analysis
##D bird_Concordance <- concordanceFun(bird_vlfAnalysis$VLFmatrix, bird_aaAnalysis$VLFmatrix, 648, 216,
##D     bird_aaAnalysis$modal)
## End(Not run)



