library(gllm)


### Name: ld2
### Title: Estimate linkage disequilibrium between two codominant autosomal
###   loci
### Aliases: ld2 print.ld2
### Keywords: category models

### ** Examples

MNS<-matrix(c(91,32,5,147,78,17,85,75,7), nr=3)
colnames(MNS)<-c("S/S","S/s","s/s")
rownames(MNS)<-c("M/M","M/N","N/N")
class(MNS)<-"table"
print(MNS)
res<-ld2(MNS)
print(res)



