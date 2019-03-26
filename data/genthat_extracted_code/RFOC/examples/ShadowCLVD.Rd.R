library(RFOC)


### Name: ShadowCLVD
### Title: Plot CLVD focal mechanism
### Aliases: ShadowCLVD
### Keywords: misc

### ** Examples


############  moment tensor from Harvard CMT catalog
sponent = 26
ef = 1*10^(sponent)
Mrr =  2.375*ef
Mtt = -2.777*ef
Mpp = 0.403*ef
Mrt = 2.800*ef
Mrp = 1.190*ef
Mtp = -0.539*ef

############  convert to cartesian coordinates
Mzz=Mrr
Mxx= Mtt
Myy= Mpp
Mxz= Mrt
Myz= -Mrp 
Mxy= -Mtp


m=matrix( c(Mxx,Mxy,Mxz,
      Mxy,Myy,Myz,
       Mxz,Myz,Mzz), ncol=3, byrow=TRUE)

Fi=seq(from=0, by=0.1, to=361)
  ###  dev.new()
    plot(cos(Fi*pi/180.0),sin(Fi*pi/180.0),type='l', asp=1 , ann=FALSE, axes=FALSE)
  
  ShadowCLVD(m, col='red')






