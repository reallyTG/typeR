library(RSEIS)


### Name: SPECT.drive
### Title: Interactive Spectrogram Driver
### Aliases: SPECT.drive
### Keywords: iplot

### ** Examples

data(CE1)

#########  Xamp = CE1$y[CE1$x>5.443754 & CE1$x<5.615951]

Xamp = CE1$y
plot(Xamp, type='l')


DT = CE1$dt

if(interactive() ) SPECT.drive(Xamp, DT = DT, NEW = TRUE, STAMP = NULL)

## Not run: 
##D data(KH)
##D 
##D Xamp  <-  KH$JSTR[[1]]
##D DT  <-   KH$dt[1]
##D SPECT.drive(Xamp, DT = DT, NEW = TRUE, STAMP = NULL)
##D 
##D SPECT.drive(Xamp, DT = DT, NEW = FALSE, STAMP = NULL,
##D freqlim=c(0, 8,0, 8) , winparams=c(4*1024, 6*250, 6*250-1) )
##D 
##D 
##D 
##D 
##D TWIN  <-  100 # seconds
##D NWIN  <-  TWIN/DT  # samples
##D NSKIP  <-  1/DT    ##  samples
##D 
##D 
##D SPECT.drive(Xamp, DT = DT, NEW = FALSE,
##D  STAMP = NULL, freqlim=c(0, 8,0, 8) ,
##D winparams=c(8*1024, NWIN, NWIN-NSKIP) )
##D 
##D 
##D 
##D 
## End(Not run)





