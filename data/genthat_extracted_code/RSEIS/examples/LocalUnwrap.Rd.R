library(RSEIS)


### Name: LocalUnwrap
### Title: Unwrap spectrum phase
### Aliases: LocalUnwrap
### Keywords: misc

### ** Examples


x  <-  1:512
amp <- sin(1*2*pi*x/16) + sin(2*2*pi*x/16)  + sin(3*2*pi*x/16)


spc <- fft(amp)

plot(Mod(spc), type='l')

angle  <-  Arg(spc)

plot(angle, type='l')

unang  <-  LocalUnwrap(angle, cutoff =pi )
plot(unang, type='l')




