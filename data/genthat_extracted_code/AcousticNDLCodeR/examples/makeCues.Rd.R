library(AcousticNDLCodeR)


### Name: makeCues
### Title: Creates a string with the cues for each frequency band and
###   segment seperated by "_"
### Aliases: makeCues

### ** Examples

## Not run: 
##D          
##D          library(tuneR)
##D          library(seewave)
##D          Wave=readWave("MyWaveFile.wav")
##D          if(Wave@samp.rate!=16000){
##D          Wave=resamp(Wave,f=Wave@samp.rate,g=16000,output="Wave")
##D          }
##D          Cues=makeCues(Wave,IntensitySteps=5,Smooth=800)
##D          
##D          
## End(Not run)



