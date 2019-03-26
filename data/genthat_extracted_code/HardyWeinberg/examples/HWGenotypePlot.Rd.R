library(HardyWeinberg)


### Name: HWGenotypePlot
### Title: Scatter plot of the genotype frequencies
### Aliases: HWGenotypePlot
### Keywords: aplot

### ** Examples

n <- 100 # sample size
m <- 100 # number of markers
Xc <- HWClo(HWData(n,m))
HWGenotypePlot(Xc,plottype=1,main="Heterozygote-homozygote scatterplot")



