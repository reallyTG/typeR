library(PTAk)


### Name: CONTRACTION
### Title: Contraction of two tensors
### Aliases: CONTRACTION CONTRACTION.list
### Keywords: array algebra

### ** Examples

 library(tensor)
   z <-  array(1:12,c(2,3,2))
   X <- array(1:48,c(3,4,2,2))
   Xcz <- CONTRACTION(X,z,Xwiz=c(1,3,4),zwiX=c(2,3,1))
   dim(Xcz)   # 4
   Xcz1 <- CONTRACTION(X,z,Xwiz=c(3,4),zwiX=c(1,3))
   dim(Xcz1) # 3,4,3
   Xcz2 <- CONTRACTION(X,z,Xwiz=c(3,4),zwiX=c(3,1))
   Xcz1[,,1]
   Xcz2[,,1]
   #######
   sval0 <- list(list(v=c(1,2,3,4)),list(v=rep(1,3)),list(v=c(1,3)))
   tew <- array(1:24,c(4,3,2))
    CONTRACTION.list(tew,sval0,moins=1)
       #this is equivalent to the following which may be too expensive for big datasets
    CONTRACTION(tew,TENSELE(sval0,moins=1),Xwiz=c(2,3))
   ##
     CONTRACTION.list(tew,sval0,moins=c(1,2)) #must be equal to
     CONTRACTION(tew,sval0[[3]]$v,Xwiz=3)
   


