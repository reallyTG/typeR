library(RFOC)


### Name: SourceType
### Title: Moment Tensor Source Type
### Aliases: SourceType
### Keywords: misc

### ** Examples

SourceType(c(1,-1,1) )

T1 = TapeBase()

m1 = list(Mxx=1.543,  Mxy=0.786,  Myy=0.336, Mxz=-2.441,  Myz=0.353,  Mzz=0.961)

i = 1
M1=matrix( c(m1$Mxx[i],m1$Mxy[i],m1$Mxz[i],
      m1$Mxy[i],m1$Myy[i],m1$Myz[i],
       m1$Mxz[i],m1$Myz[i],m1$Mzz[i]), ncol=3, byrow=TRUE)

 E1 = eigen(M1)
           h = SourceType( sort(E1$values, decreasing=TRUE) )
           h$dip = 90-h$phi
           ##  cat(paste(h$dip, h$lam, sep=" "), sep="\n")
           h1 = HAMMERprojXY(h$dip*pi/180, h$lam*pi/180)



TapePlot(T1)
           points(h1$x, h1$y,  pch=21, bg="red" )








