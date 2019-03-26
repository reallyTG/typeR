library(MixMAP)


### Name: mixmapPI
### Title: Implements the MixMAP algorithm using prediction intervals.
### Aliases: mixmapPI
### Keywords: GWAS Mixed Models Genetics

### ** Examples

library(MixMAP)	
#Load data
#This data has been prepared to be used as input to the MixMAP function
data(MixMAP_example)
#Run MixMAP
MixOut<-mixmapPI(MixMAP_example,pval="GC.Pvalue",snp="MarkerName",
  chr="Chr",coord="Coordinate",gene="Gene")
#Display first ten detected genes
summary(MixOut)
#MixManhattan Plot
plot(MixOut)



