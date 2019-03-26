library(tuneR)


### Name: WaveMC
### Title: Constructors and coercion for class WaveMC objects
### Aliases: WaveMC WaveMC,ANY-method WaveMC,Wave-method
###   WaveMC,numeric-method WaveMC,matrix-method WaveMC,data.frame-method
###   WaveMC,list-method [,WaveMC-method coerce,matrix,WaveMC-method
###   coerce,data.frame,WaveMC-method coerce,list,WaveMC-method
###   coerce,numeric,WaveMC-method coerce,WaveMC,data.frame-method
###   coerce,WaveMC,matrix-method coerce,WaveMC,Wave-method
### Keywords: methods

### ** Examples

# constructing a WaveMC object (1 sec.) containing sinus sound with 440Hz:
x <- seq(0, 2*pi, length = 44100)
channel <- round(32000 * sin(440 * x))
WMCobj <- WaveMC(data = channel)
WMCobj



