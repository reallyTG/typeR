library(tuneR)


### Name: Wave
### Title: Constructors and coercion for class Wave objects
### Aliases: Wave Wave,ANY-method Wave,WaveMC-method Wave,numeric-method
###   Wave,matrix-method Wave,data.frame-method Wave,list-method
###   [,Wave-method coerce,matrix,Wave-method coerce,data.frame,Wave-method
###   coerce,list,Wave-method coerce,numeric,Wave-method
###   coerce,Wave,data.frame-method coerce,Wave,matrix-method
###   coerce,WaveGeneral,list-method coerce,Wave,WaveMC-method
### Keywords: methods

### ** Examples

# constructing a Wave object (1 sec.) containing sinus sound with 440Hz:
x <- seq(0, 2*pi, length = 44100)
channel <- round(32000 * sin(440 * x))
Wobj <- Wave(left = channel)
Wobj

# or more easily:
Wobj <- sine(440)



