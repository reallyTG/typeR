library(rehh)


### Name: distribplot
### Title: Distribution of standardized iHS or Rsb values
### Aliases: distribplot

### ** Examples

data(wgscan.cgu) 
## results from a genome scan (44,057 SNPs) see ?wgscan.eut for details
val.ihs<-ihh2ihs(wgscan.cgu)$iHS[,3]
##standardize
distribplot(val.ihs,main="iHS (CGU population)")
dev.off()



