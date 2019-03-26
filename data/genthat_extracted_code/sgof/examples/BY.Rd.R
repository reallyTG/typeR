library(sgof)


### Name: BY
### Title: Benjamini-Yekutieli (BY) multiple testing procedure
### Aliases: BY print.BY Benjamini-Yekutieli
### Keywords: htest Benjamini-Yekutieli FDR BY correlation multi-testing

### ** Examples




res<-BY(Hedenfalk$x)
summary(res)   #number of rejected nulls, estimated FDR
plot(res)   #adjusted p-values



