library(wsyn)


### Name: cleandat
### Title: Clean (spatio)temporal data matrices to make them ready for
###   analyses using the 'wsyn' package
### Aliases: cleandat

### ** Examples

times<-1:100
dat<-rnorm(100)
res1<-cleandat(dat,times,1) #this removes the mean
res2<-cleandat(dat,times,2) #detrends and removes the mean
res3<-cleandat(dat,times,3) #variances also standardized
res4<-cleandat(dat,times,4) #also joint Box-Cox applied
res5<-cleandat(dat,times,5) #1-3, also indiv Box-Cox




