library(ImportExport)


### Name: format_corrector
### Title: Identify and corrects variable formats
### Aliases: format_corrector
### Keywords: format_corrector

### ** Examples

require(ImportExport)
a<-c(1,NA,3,5,".")
b<-c("19/11/2006","05/10/2011","09/02/1906","22/01/1956","10/10/2010")
c<-101:105
x<-data.frame(a,b,c)
sapply(x,class)
x_corr<-format_corrector(x)
sapply(x_corr,class)




