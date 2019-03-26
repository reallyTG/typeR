library(RSEIS)


### Name: plotevol
### Title: Plot Spectrogram
### Aliases: plotevol blankevol plotevol2
### Keywords: hplot

### ** Examples



data(CE1)

Xamp <- CE1$y

DT <- CE1$dt

 tsecs <- DT*(length(Xamp)*.02)
    multi <- 2
scale.def <- 1
  TWOSEC <- tsecs*(1/DT)
    
  NS <- floor(multi*TWOSEC)
  NOV <- floor(multi*(TWOSEC-.2*TWOSEC))

    
    Nfft<-4096

    pal <- rainbow(100)

    fl  <- 0
   fh <- 1/(2*DT)

   flshow <-  .5
   fhshow <- 120

   DEV <- evolfft(Xamp,DT , Nfft=Nfft, Ns=NS , Nov=NOV,  fl=fl, fh=fh  )

  PE <-  plotevol(DEV, log=scale.def, fl=flshow, fh=fhshow,
                 col=pal, ygrid=FALSE, STAMP="HITHERE", STYLE="fft")







