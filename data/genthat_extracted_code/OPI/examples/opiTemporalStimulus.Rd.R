library(OPI)


### Name: opiTemporalStimulus
### Title: Stimulus parameter list.
### Aliases: opiTemporalStimulus
### Keywords: misc

### ** Examples

    # A Size III flickering with a 10Hz square wave at
    # location (7,7) with luminance 10 dB (HFA) 
stim <- list(x=7, y=7, size=0.43, color="white", 
                rate=20,        # one lut step per 50 ms 
                lut=c(0,318),   # so one full lut per 100 ms == 10Hz 
                duration=400,   # and 4 cycles per stimulus
                responseWindow=1500) 
class(stim) <- "opiTemporalStimulus"



