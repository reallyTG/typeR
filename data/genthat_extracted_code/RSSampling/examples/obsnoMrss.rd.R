library(RSSampling)


### Name: obsno.Mrss
### Title: observation numbers based on classical and modified ranked set
###   sampling methods
### Aliases: obsno.Mrss

### ** Examples

  y=rexp(10000)
  ## Determining the observation numbers of the units which are chosen to sample

  y=rexp(10000)
  obsno.Mrss(y,m=3,r=5)
  obsno.Mrss(y,m=5,r=6,type="m")
  obsno.Mrss(y,m=7,r=3,type="e")
  obsno.Mrss(y,m=4,r=5,type="p",p=0.3)
  obsno.Mrss(y,m=6,r=2,type="bg")



