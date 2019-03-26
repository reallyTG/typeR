library(rehh)


### Name: xpehhplot
### Title: Plot XPEHH over a genome
### Aliases: xpehhplot

### ** Examples

data(wgscan.cgu) ; data(wgscan.eut) 
## results from a genome scan (44,057 SNPs)
#see ?wgscan.eut and ?wgscan.cgu for details
res.xpehh<-ies2xpehh(wgscan.cgu,wgscan.eut,"CGU","EUT")
xpehhplot(res.xpehh)



