library(PairedData)


### Name: summary
### Title: Summary statistics for paired samples
### Aliases: summary summary.paired summary,paired-method
### Keywords: methods

### ** Examples

z<-rnorm(20)
x<-rnorm(20)+z
y<-rnorm(20)+z+1
p<-paired(x,y)
summary(p)



