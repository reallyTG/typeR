library(reddPrec)


### Name: gapFilling
### Title: Daily precipitation reconstruction. Makes predictions to all
###   days and locations.
### Aliases: gapFilling

### ** Examples


  #loads example data
  data(precipDataset)

  #runs function
  gapFilling(prec=cleaned,sts=sts,inidate=as.Date('2001-01-01'),
    enddate=as.Date('2001-01-02'),parallel=TRUE,ncpu=2,thres=NA)



