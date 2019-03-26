library(ade4)


### Name: humDNAm
### Title: human mitochondrial DNA restriction data
### Aliases: humDNAm
### Keywords: datasets

### ** Examples

data(humDNAm)
dpcoahum <- dpcoa(data.frame(t(humDNAm$samples)), 
    sqrt(humDNAm$distances), scan = FALSE, nf = 2)
plot(dpcoahum)



