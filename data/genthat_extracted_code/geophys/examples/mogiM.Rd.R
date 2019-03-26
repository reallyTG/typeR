library(geophys)


### Name: mogiM
### Title: Mogi Model
### Aliases: mogiM
### Keywords: misc

### ** Examples



data(PXY)

delV = 2.3E13/(100^3)    ##### (convert to meter^3 from cm^3)
F = 2.8E5/100      ##### (convert to meter from cm    )

EX = seq(from=0, by=100, to= 9000)


Atest = mogiM(R=EX,F=F,A=delV)



 plot(PXY, pch=6, col='purple', xlim=c(0,9), ylim=c(0, 1) )
    ###  model
    lines(EX/1000, Atest$uz/max(Atest$uz))


############ best fit   optimization

library(stats)

    fr<-function(x)
      {

        Atest = mogiM(R=PXY$x*1000 ,F=x[1],A=x[2])


        rms = sum ( (PXY$y - Atest$uz/max(Atest$uz))^2 )

        return(rms)
      }
xin = c(2600, 2.0e+07)

FOUT = stats::optim(xin , fr)

  Btest = mogiM(R=EX,F=FOUT$par[1] ,A=FOUT$par[2])

   plot(PXY, pch=6, col='purple', xlim=c(0,9), ylim=c(0, 1) )
 
 lines(EX/1000, Btest$uz/max(Btest$uz))







    



