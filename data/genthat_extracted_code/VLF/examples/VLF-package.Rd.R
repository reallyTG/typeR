library(VLF)


### Name: VLF-package
### Title: Frequency Matrix Approach for Assessing Very Low Frequency
###   Variants in Sequence Records
### Aliases: VLF-package VLF
### Keywords: VLFs

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
##D nuc_matrix <- bird_vlfAnalysis$VLFmatrix
##D aa_matrix <- bird_aaAnalysis$VLFmatrix
##D aa_modal <- bird_aaAnalysis$modal
##D bird_Concordance <- concordanceFun(nuc_matrix, aa_matrix, 648, 216, aa_modal)
## End(Not run)


