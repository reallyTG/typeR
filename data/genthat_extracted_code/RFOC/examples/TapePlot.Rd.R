library(RFOC)


### Name: TapePlot
### Title: Tape style Lune Plot
### Aliases: TapePlot
### Keywords: misc

### ** Examples


T1 = TapeBase()
TapePlot(T1)

 data(widdenMoments)
WM = widdenMoments
        
         par(mfrow=c(1,1), mai=c(0,0,0,0))
         T1 = TapeBase()
         TapePlot(T1)

         for(i in 1:length(WM$Mxx))
         {
           M1=matrix( c(WM$Mxx[i],WM$Mxy[i],WM$Mxz[i],
      WM$Mxy[i],WM$Myy[i],WM$Myz[i],
       WM$Mxz[i],WM$Myz[i],WM$Mzz[i]), ncol=3, byrow=TRUE)

           E1 = eigen(M1)
           h = SourceType( sort(E1$values, decreasing=TRUE) )
           h$dip = 90-h$phi
           ##  cat(paste(h$dip, h$lam, sep=" "), sep="\n")
           h1 = HAMMERprojXY(h$dip*pi/180, h$lam*pi/180)
           
           points(h1$x, h1$y,  pch=21, bg="orange" )

         }








