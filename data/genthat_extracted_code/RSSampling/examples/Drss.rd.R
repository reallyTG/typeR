library(RSSampling)


### Name: Drss
### Title: Selecting double (classical or modified) ranked set sample
### Aliases: Drss

### ** Examples

 data=rnorm(10000)
 ##Seleceting a double ranked set sample
 Drss(data,m=4,r=3,sets=TRUE)
 ##Seleceting a double median ranked set sample
 Drss(data,m=4,r=3,type="dm",sets=TRUE)
 ##Seleceting a double extreme ranked set sample
 Drss(data,m=4,r=3,type="de",sets=TRUE)
 ##Seleceting a double percentile ranked set sample
 Drss(data,m=4,r=3,type="dm",sets=TRUE,p=0.6)



