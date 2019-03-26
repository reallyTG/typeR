library(fda.usc)


### Name: semimetric.NPFDA
### Title: Proximities between functional data (semi-metrics)
### Aliases: semimetric.NPFDA semimetric.deriv semimetric.fourier
###   semimetric.hshift semimetric.mplsr semimetric.pca
### Keywords: cluster

### ** Examples


#	INFERENCE PHONDAT
data(phoneme)
ind=1:100 # 2 groups
mlearn<-phoneme$learn[ind,]
mtest<-phoneme$test[ind,]
n=nrow(mlearn[["data"]])
np=ncol(mlearn[["data"]])
mdist1=semimetric.pca(mlearn,mtest)
mdist2=semimetric.pca(mlearn,mtest,q=2)
mdist3=semimetric.deriv(mlearn,mtest,nderiv=0)
mdist4=semimetric.fourier(mlearn,mtest,nderiv=2,nbasis=21)
#uses hshift function
#mdist5=semimetric.hshift(mlearn,mtest) #takes a lot
glearn<-phoneme$classlearn[ind]
#uses mplsr function
mdist6=semimetric.mplsr(mlearn,mtest,5,glearn)
mdist0=metric.lp(mlearn,mtest)
b=as.dist(mdist6)
c2=hclust(b)
plot(c2)
memb <- cutree(c2, k = 2)
table(memb,phoneme$classlearn[ind])
   




