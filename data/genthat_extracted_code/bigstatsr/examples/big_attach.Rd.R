library(bigstatsr)


### Name: big_attach
### Title: Attach a Filebacked Big Matrix
### Aliases: big_attach big_attachExtdata
### Keywords: internal

### ** Examples

# tmpFBM
X <- FBM(10, 10)$save()

rdsfile <- sub_bk(X$backingfile, ".rds")
X2 <- big_attach(rdsfile)

all.equal(X[], X2[])



