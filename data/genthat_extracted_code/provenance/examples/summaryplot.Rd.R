library(provenance)


### Name: summaryplot
### Title: Joint plot of several provenance datasets
### Aliases: summaryplot

### ** Examples

data(Namib)
KDEs <- KDEs(Namib$DZ,0,3000)
summaryplot(KDEs,Namib$HM,Namib$PT,ncol=2)



