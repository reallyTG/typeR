library(sgof)


### Name: BH
### Title: Benjamini-Hochberg (BH) multiple testing procedure
### Aliases: BH print.BH Benjamini-Hochberg
### Keywords: htest BH Benjamini-Hochberg FDR multi-testing

### ** Examples




res<-BH(Hedenfalk$x)
summary(res)   #number of rejected nulls, estimated FDR
plot(res)   #adjusted p-values



