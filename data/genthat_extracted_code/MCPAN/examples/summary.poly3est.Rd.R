library(MCPAN)


### Name: summary.poly3est
### Title: Detailed print out for poly3est
### Aliases: summary.poly3est
### Keywords: print

### ** Examples


data(methyl)
head(methyl)

estk3<-poly3estf(time=methyl$death, status=methyl$tumour, f=methyl$group)
summary(estk3)

estk5<-poly3estf(time=methyl$death, status=methyl$tumour, f=methyl$group, k=5)
summary(estk5)




