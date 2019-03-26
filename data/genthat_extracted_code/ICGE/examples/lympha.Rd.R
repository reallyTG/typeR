library(ICGE)


### Name: lympha
### Title: Limphatic Database
### Aliases: lympha
### Keywords: datasets

### ** Examples

data(lympha)
aux <- table(lympha[,1])
barplot(aux, names.arg=c("normal", "metastases", "malign lymph", "fibrosis"))



