library(QTLRel)


### Name: pedRecode
### Title: Recode a Pedigree
### Aliases: pedRecode

### ** Examples

data(miscEx)

pedF8[1:10,]
pedR<- pedRecode(pedF8)
pedR[1:10,]
dim(pedR)
pedR<- pedRecode(pedF8, ids=pedF8$id[pedF8$gener=="F8"])
dim(pedR)



