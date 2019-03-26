library(fda.usc)


### Name: kmeans.fd
### Title: K-Means Clustering for functional data
### Aliases: kmeans.fd kmeans.center.ini kmeans.assig.groups
###   kmeans.centers.update
### Keywords: cluster

### ** Examples


## Not run: 
##D data(phoneme)
##D mlearn<-phoneme$learn[c(1:50,101:150,201:250),]
##D 
##D #Unsupervised classification
##D out.fd1=kmeans.fd(mlearn,ncl=3,draw=TRUE)
##D out.fd2=kmeans.fd(mlearn,ncl=3,draw=TRUE,par.ini=list(method="exact"))
##D # Different Depth function
##D ind=c(17,77,126)
##D out.fd3=kmeans.fd(mlearn,ncl=mlearn[ind,],draw=FALSE,
##D dfunc=func.trim.FM,par.dfunc=list(trim=0.1))
##D out.fd4=kmeans.fd(mlearn,ncl=mlearn[ind,],draw=FALSE,
##D dfunc=func.med.FM)
##D out.fd5=kmeans.fd(mlearn,ncl=3,dfunc=func.trim.RPD,
##D max.iter=10,par.dfunc=list(dfunc="depth.FM",deriv=c(0,1,1)))
##D group=c(rep(1,50),rep(2,50),rep(3,50))
##D table(out.fd5$cluster,group)
## End(Not run)



