library(pheno2geno)


### Name: find.mixups
### Title: Find sample mix-ups
### Aliases: find.mixups
### Keywords: manip

### ** Examples

	data(testPopulation)
  scores <- find.mixups(testPopulation,map="genetic",n.qtls=10,threshold=5,verbose=FALSE)
  plot(scores[[2]])



