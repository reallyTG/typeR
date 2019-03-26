library(reddPrec)


### Name: qcPrec
### Title: Quality control: Identifies and removes suspect data from the
###   original dataset
### Aliases: qcPrec

### ** Examples

  #loads example data
  data(precipDataset)

  #runs function
  qcPrec(prec=preci,sts=sts,inidate=as.Date('2001-01-01'),
    enddate=as.Date('2001-01-02'),parallel=TRUE,ncpu=2,printmeta=TRUE,thres=NA)



