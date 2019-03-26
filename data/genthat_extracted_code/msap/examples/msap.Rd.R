library(msap)


### Name: msap
### Title: Diversity analysis of MSAP data
### Aliases: msap

### ** Examples

	#Perform all default analysis
	## Not run: msap("MyDataFile", name="MyAnalysis")
	#Perform all default analysis for a dataset with 2 primer combinations 
  #(200 and 180 fragments each)
	## Not run: msap("MyDataFile", name="MyAnalysis", loci.per.primer=c(200, 180))
	#Perform analysis assumes that HPA-/MSP- represents full methylation 
	## Not run: msap("MyDataFile", name="MyAnalysis", uninformative=FALSE)
	#The same that above but skipping the PCoA results 
	## Not run: msap("MyDataFile", name="MyAnalysis", uninformative=FALSE, do.pcoa=FALSE)
	#Using only some of the populations
	## Not run: msap("MyDataFile", name="MyAnalysis", use.groups=c('Control','pop1','pop3'))



