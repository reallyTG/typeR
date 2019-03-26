library(RSSampling)


### Name: sign1testrss
### Title: Sign Test with RSS
### Aliases: sign1testrss

### ** Examples


  data=rnorm(10000,0,1)
  samplerss=as.numeric(rss(data,m=3,r=12))
  sign1testrss(samplerss,m=3,r=12,median0=0.5)



