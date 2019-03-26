library(FisHiCal)


### Name: lsmacof
### Title: 3D reconstruction from Hi-C distances
### Aliases: lsmacof

### ** Examples

 data(calibHiC)
 data(match)
 data(conf)
 predConf = lsmacof(calibHiC, max(match$distances))
 
 # superimpose
 partialPS<-function(m1, m2)
 {
    # translate to origin
    tm1<-scale(m1, scale = FALSE)
    tm2<-scale(m2, scale = FALSE)
    A<-svd(t(tm2)%*%tm1)
    v<-A$u
    w<-A$v
    # update v a det(R) is positive
    k = ncol(m1)
    d = sign(det(t(w)%*%t(v)))
    v[,k] = v[,k]*-1*d
    R<- w%*%t(v)
    return(list(m1=tm1%*%R,m2=tm2))
  }

  res = partialPS(predConf, conf) 
  if (require(rgl))
  {
    plot3d(res$m2, type = "l", axes = FALSE, box = FALSE, xlab = "", ylab = "", zlab = "")
    lines3d(res$m1, col = "red")
  }




