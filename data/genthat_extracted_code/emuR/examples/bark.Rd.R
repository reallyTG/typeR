library(emuR)


### Name: bark
### Title: Convert Hertz to Bark and Bark to Hertz
### Aliases: bark bark.trackdata bark.spectral bark.default
### Keywords: math

### ** Examples





   # convert Hertz values to Bark

        vec <- c(500, 1500, 2500)

        vec

        bark(vec)



        

        # convert Hertz values to Bark and back to Hertz

        bark(bark(vec, inv=TRUE))

        



        # convert the \$data values in a trackdata object to Bark

        # create a new track data object

        t1 <- dip.fdat

        t1[1]

        



        # convert Hertz to Bark

        t1$data <- bark(t1$data)

        t1[1]



# warp the frequency axis of a spectral object such

# that it is proportional to the Bark scale.

w = bark(e.dft)

par(mfrow=c(1,2))

plot(w, type="l")



# The values of w are at equal Bark intervals. Compare

# with

plot(e.dft, freq=bark(trackfreq(e.dft)))

# the latter has a greater concentration of values

# in a higher frequency range.







