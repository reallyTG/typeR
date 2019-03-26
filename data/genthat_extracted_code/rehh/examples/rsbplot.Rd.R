library(rehh)


### Name: rsbplot
### Title: Plot Rsb over a genome
### Aliases: rsbplot

### ** Examples

data(wgscan.cgu) ; data(wgscan.eut) 
## results from a genome scan (44,057 SNPs)
#see ?wgscan.eut and ?wgscan.cgu for details
res.rsb<-ies2rsb(wgscan.cgu,wgscan.eut,"CGU","EUT")
rsbplot(res.rsb)



