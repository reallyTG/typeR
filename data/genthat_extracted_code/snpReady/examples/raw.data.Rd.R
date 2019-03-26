library(snpReady)


### Name: raw.data
### Title: Preparation of genomic data
### Aliases: raw.data

### ** Examples

data(maize.line)
M <- as.matrix(maize.line)
mrc <- raw.data(M, frame="long", base=TRUE, sweep.sample= 0.8, 
         call.rate=0.95, maf=0.05, imput=FALSE, outfile="-101")




