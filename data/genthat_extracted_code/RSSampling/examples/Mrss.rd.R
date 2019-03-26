library(RSSampling)


### Name: Mrss
### Title: Selecting a ranked set sample (classical or modified)
### Aliases: Mrss

### ** Examples

  data=rgamma(10000,1,1)
  ## Selecting a median ranked set sample
  Mrss(data,m=4,r=5,sets=TRUE,type="m")
   ## Selecting an extreme ranked set sample
  Mrss(data,m=3,r=5,sets=TRUE,type="e")
   ## Selecting a percentile ranked set sample
  Mrss(data,m=4,r=3,sets=TRUE,type="p",p=0.2)
   ## Selecting a balanced groups ranked set sample
  Mrss(data,m=6,r=2,sets=TRUE,type="bg")




