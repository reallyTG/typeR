library(reddPrec)


### Name: gridPcp
### Title: Gridding daily precipitation.
### Aliases: gridPcp

### ** Examples


  #loads example data
  data(precipDataset)

  #runs function (only for two days)
  gridPcp(filled=filled,points=points,sts=sts,inidate=as.Date('2001-01-01'),
    enddate=as.Date('2001-01-01'),parallel=TRUE,ncpu=2)




