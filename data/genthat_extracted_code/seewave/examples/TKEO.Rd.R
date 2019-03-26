library(seewave)


### Name: TKEO
### Title: Teager-Kaiser energy tracking operator
### Aliases: TKEO tkeo
### Keywords: ts

### ** Examples

op <- par(mfrow=c(2,1))

## sinusoid AM 
s1 <- synth(f=8000, d=0.1, cf=200, am=c(100,10), output="Wave") 
oscillo(s1)
TKEO(s1)
## linear AM decrease
s2 <- synth(f=8000, d=0.1, cf=200, shape="decr", output="Wave") 
oscillo(s2)
TKEO(s2)
## sinusoid FM
s3 <- synth(f=8000, d=0.1, cf=200, fm=c(150,50,0,0,0), output="Wave") 
oscillo(s3)
TKEO(s3)
## linear FM increase
s4 <- synth(f=8000, d=0.1, cf=200, fm=c(0,0,600,0,0), output="Wave") 
oscillo(s4)
TKEO(s4)
## AM and FM
s5 <- synth(f=8000, d=0.1, cf=200, am=c(100,10), fm=c(150,50,0,0,0), output="Wave")
oscillo(s5)
TKEO(s5)
par(op)



