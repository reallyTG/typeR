library(cbanalysis)


### Name: nvdescstat
### Title: Numerical Variable Descriptive Statistics returns a data frame
###   containing descriptive statistics for numerical variable.
### Aliases: nvdescstat

### ** Examples

numv1<-c(8000,200,323)
numv2<-c(400,533,633)
numv3<-c(100,534,734)
numv4<-c(1,25,34)
chrv6<-c("a","b","c")
numv5<-c(50,10000,34000)
chrv7<-as.factor(c("male","female","unknown"))
numv6<-c(NA,300,340)
df<-data.frame(numv1,numv2,chrv6,numv3,numv4,numv5,chrv7,numv6)
nvdescstatdf<-nvdescstat(df)



