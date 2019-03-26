library(MixMAP)


### Name: Plot
### Title: Method for creating a MixManhattan plot.
### Aliases: plot,MixMAP-method
### Keywords: GWAS Genetics Mixed Models

### ** Examples

data(MixMAP_example)
#Run mixmapTest
MixOut<-mixmapTest(MixMAP_example,pval="GC.Pvalue",snp="MarkerName",
  chr="Chr",coord="Coordinate",gene="Gene")
plot(MixOut)

#Run mixmapPI
MixOutPI<-mixmapTest(MixMAP_example,pval="GC.Pvalue",snp="MarkerName",
  chr="Chr",coord="Coordinate",gene="Gene")
plot(MixOutPI)



