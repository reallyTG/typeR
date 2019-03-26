library(rehh)


### Name: ihsplot
### Title: Plot iHS over a genome
### Aliases: ihsplot

### ** Examples

data(wgscan.cgu) 
## results from a genome scan (44,057 SNPs)
##see ?wgscan.eut and ?wgscan.cgu for details
res.ihs<-ihh2ihs(wgscan.cgu)
ihsplot(res.ihs)



