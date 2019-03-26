library(SAFD)


### Name: Fmedian
### Title: Median of a fuzzy sample
### Aliases: Fmedian
### Keywords: univar manip

### ** Examples

#Example 1:
data(XX)
V<-translator(XX[[3]],100)
YY<-vector("list",length=50)
  for(i in 1:50){
   YY[[i]]<-generator(V,,,)
   }
Me<-Fmedian(YY)

#Example 2:
data(Trees)
Species1_Median<-Fmedian(Trees[[1]],nl=11)
Species1_Median
Species2_Median<-Fmedian(Trees[[2]])
Species3_Median<-Fmedian(Trees[[3]])



