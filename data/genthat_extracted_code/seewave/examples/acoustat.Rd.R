library(seewave)


### Name: acoustat
### Title: Statistics on time and frequency STFT contours
### Aliases: acoustat
### Keywords: ts

### ** Examples

data(tico)
note <- cutw(tico, from=0.5, to=0.9, output="Wave")
## default setting
acoustat(note)
## change the percentile fraction
acoustat(note, fraction=50)
## change the STFT parameters
acoustat(note, wl=1024, ovlp=80)
## change the function to compute the aggregate contours
## standard deviation instead of sum   
acoustat(note, aggregate=sd)
## direct time and frequency selection     
acoustat(tico, tlim=c(0.5,0.9), flim=c(3,6))
## some useless graphical changes
acoustat(note, type="o", col="blue") 



