library(MixMAP)


### Name: mixmapTest
### Title: Implements the MixMAP algorithm using hypothesis testing
###   framework.
### Aliases: mixmapTest
### Keywords: GWAS Mixed Models Genetics

### ** Examples

library(MixMAP)	
#Load data
#This data has been prepared to be used as input to the MixMAP function
data(MixMAP_example)
#Run MixMAP
MixOut<-mixmapTest(MixMAP_example,pval="GC.Pvalue",snp="MarkerName",
  chr="Chr",coord="Coordinate",gene="Gene")
#Display first ten detected genes
summary(MixOut)
#MixManhattan Plot
plot(MixOut)



