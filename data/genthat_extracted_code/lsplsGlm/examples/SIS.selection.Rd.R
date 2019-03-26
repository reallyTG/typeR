library(lsplsGlm)


### Name: SIS.selection
### Title: Sure Independence Screening
### Aliases: SIS.selection

### ** Examples

data("BreastCancer")
X<-scale(BreastCancer$X)
Y<-BreastCancer$Y
## No test: 
Xsis<-SIS.selection(X,Y,50)
## End(No test)



