library(ARTIVA)


### Name: drosophila
### Title: Drosphila life cycyle time series by Arbeitman et al 2002.
### Aliases: drosophila
### Keywords: datasets

### ** Examples

#load the data
data(drosophila)

#plot time serie for a chosen gene 
gene=1
plot(1:67,drosophila[gene,],type="l",xlab="Timepoints", ylab="LogRatio",
main=row.names(drosophila)[gene])



