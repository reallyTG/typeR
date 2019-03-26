library(NetworkDistance)


### Name: nd.nfd
### Title: Network Flow Distance
### Aliases: nd.nfd

### ** Examples

## Not run: 
##D set.seed(23)
##D Total<-20
##D N1<-Total/2
##D P1<-0.75
##D P2<-0.6
##D P12=0.04
##D Iteration<-2
##D CAP<-4
##D 
##D bb<-list()         ## edges to remove
##D bb[[1]]<-c(1,1)
##D bb[[2]]<-c(4,19)
##D bb[[3]]<-c(12,17)
##D bb[[4]]<-c(13,18)
##D bb[[5]]<-c(1,3)
##D bb[[6]]<-c(15,8)
##D bb[[7]]<-c(2,6)
##D 
##D 
##D A<-matrix(0,nrow=Total,ncol=Total)                       ######### define adjacent matrix
##D for(i in (1:(N1-1)))
##D {for(j in ((i+1):N1))
##D {A[i,j]<-rbinom(1,1,P1)
##D A[j,i]<-A[i,j]}
##D }
##D 
##D for(i in ((N1+1):(Total-1)))
##D {for(j in ((i+1):Total))
##D { A[i,j]<-rbinom(1,1,P2)
##D A[j,i]<-A[i,j]
##D }
##D }
##D for(i in (1:N1))
##D {for(j in (N1+1):Total)
##D {A[i,j]<-rbinom(1,1,P12)
##D A[j,i]<-A[i,j]
##D }
##D }
##D 
##D listA = list()
##D for (i in 1:7){
##D    tgtA = A
##D    idm  = bb[[i]][1]
##D    idn  = bb[[i]][2]
##D 
##D    tgtA[idm,idn] = 0
##D    tgtA[idn,idm] = 0
##D    listA[[i]] = tgtA
##D }
##D 
##D # compute two diffusion-based distances and visualize
##D out1 = nd.gdd(listA, out.dist=FALSE)$D
##D out2 = testdec(listA, out.dist=FALSE)$D
##D par(mfrow=c(1,2))
##D image(pracma::flipud(out1),col=gray((0:32)/32), main="Hammond Pairwise Distance",axes=FALSE)
##D image(pracma::flipud(out2),col=gray((0:32)/32), main="Dianbin Pairwise Distance",axes=FALSE)
## End(Not run)




