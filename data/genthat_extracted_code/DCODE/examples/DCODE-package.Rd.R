library(DCODE)


### Name: DCODE-package
### Title: List Linear n-Peptide Constraints for Overlapping Protein
###   Regions
### Aliases: DCODE-package DCODE
### Keywords: double-coding sequences genetic code stop codons codon usage
###   amino acid composition linear and logical constraints overlapping
###   gene

### ** Examples

	## Not run: 
##D # 1) Build peptideList, used by function getConstraint.
##D mydata <- build_data()
##D aaList <- mydata$aaList
##D geneticCode <- mydata$geneticCode
##D peptideList <- mydata$peptideList
##D 
##D # 2) Ask for the constraint induced on a chosen peptide in a chosen overlapping frame
##D 
##D ## amino acid contraints 
##D getConstraint("C", frame = -2, code=geneticCode, pepList=peptideList) 
##D getConstraint("D", frame = 1, code=geneticCode, pepList=peptideList)
##D 
##D ## 3-peptide contraints
##D getConstraint("CWC",frame = -2, code=geneticCode, pepList=peptideList)
##D 
##D ## 5-peptide contraints
##D getConstraint("CWCCC",frame = -2, code=geneticCode, pepList=peptideList)
##D 	
## End(Not run)



