library(MixMAP)


### Name: MixMAP-package
### Title: MixMAP: Mixed Modeling of Meta-Analysis P-values
### Aliases: MixMAP-package lme4-package
### Keywords: package

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



