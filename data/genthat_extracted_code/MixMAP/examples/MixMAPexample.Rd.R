library(MixMAP)


### Name: MixMAP_example
### Title: A working example of the MixMAP algorithm.
### Aliases: MixMAP_example
### Keywords: GWAS Mixed Models Genetics

### ** Examples

library(MixMAP)	
#Load data
#This data has been prepared to be used as input to the MixMAP function directly
data(MixMAP_example)
str(MixMAP_example)

#Run mixmapTest
MixOut<-mixmapTest(MixMAP_example,pval="GC.Pvalue",snp="MarkerName",
  chr="Chr",coord="Coordinate",gene="Gene")
#Display first ten detected genes
summary(MixOut)
#MixManhattan Plot
plot(MixOut)



