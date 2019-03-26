library(emuR)


### Name: mel
### Title: Convert Hz to the mel scale
### Aliases: mel mel.trackdata mel.spectral
### Keywords: math

### ** Examples



 #convert Hertz values to mel

 vec <- c(500, 1500, 2500)
 vec
 mel(vec)

        
        # convert Hertz values to mel 

        mel(vec)
        

        # convert the \$data values in a trackdata object to mel
        # create a new track data object

        t1 <- dip.fdat
        t1[1]
        
        # convert Hertz to mel

        t1$data <- mel(t1$data)
        t1[1]

# warp the frequency axis of a spectral object such
# that it is proportional to the mel scale.

w = mel(e.dft)
par(mfrow=c(1,2))
plot(w, type="l")


# The values of w are at equal mel intervals. Compare
# with

plot(e.dft, freq=mel(trackfreq(e.dft)))

# the latter has a greater concentration of values
# in a higher frequency range.




