library(MixMAP)


### Name: Summary
### Title: Summary of a 'MixMAP' object
### Aliases: summary,MixMAP-method
### Keywords: GWAS Genetics Mixed Models

### ** Examples

data(MixMAP_example)
#Run mixmapTest
MixOut<-mixmapTest(MixMAP_example,pval="GC.Pvalue",snp="MarkerName",
  chr="Chr",coord="Coordinate",gene="Gene")
summary(MixOut)

#Run mixmapPI
MixOutPI<-mixmapPI(MixMAP_example,pval="GC.Pvalue",snp="MarkerName",
  chr="Chr",coord="Coordinate",gene="Gene")
summary(MixOutPI)



