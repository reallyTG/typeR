library(haplo.stats)


### Name: seqhap
### Title: Sequential Haplotype Scan Association Analysis for Case-Control
###   Data
### Aliases: seqhap print.seqhap

### ** Examples


# load example data with response and genotypes. 
data(seqhap.dat)
mydata.y <- seqhap.dat[,1]
mydata.x <- seqhap.dat[,-1]
# load positions
data(seqhap.pos)
pos <- seqhap.pos$pos
# run seqhap with default settings
## Not run: 
##D   # this example takes 5-10 seconds to run
##D   myobj <- seqhap(y=mydata.y, geno=mydata.x, pos=pos)
##D   print.seqhap(myobj)
## End(Not run)



