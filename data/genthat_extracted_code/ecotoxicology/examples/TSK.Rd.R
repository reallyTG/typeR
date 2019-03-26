library(ecotoxicology)


### Name: TSK
### Title: Trimmed Spearman-Karber method, as per Hamilton and EPA
### Aliases: TSK

### ** Examples

x<-c(15.54,20.47,27.92,35.98,55.52)
n1<-c(20,20,20,19,20)
r<-c(0,0,0,5.26,100)/100*n1
n<-c(20,20,20,19,20)
TSK(x,r,n)



