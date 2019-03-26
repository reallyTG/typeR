library(RSSampling)


### Name: varRSS
### Title: Variance estimation based on ranked set sampling
### Aliases: varRSS

### ** Examples


 data=rnorm(10000,2,1)
 samplerss=rss(data,m=4,r=3,sets=FALSE)
 ## Estimation of variance based on ranked set sample by Stokes
 varRSS(samplerss,m=4,r=3,type="Stokes")
  ## Estimation of variance based on ranked set sample by Montip&Sukuman
 varRSS(samplerss,m=4,r=3,type="Montip")




