library(float)


### Name: backsolve
### Title: backsolve
### Aliases: backsolve backsolve,float32,float32-method
###   backsolve,float32,BaseLinAlg-method
###   backsolve,BaseLinAlg,float32-method
###   forwardsolve,float32,float32-method
###   forwardsolve,float32,BaseLinAlg-method
###   forwardsolve,BaseLinAlg,float32-method

### ** Examples

library(float)

s = flrunif(10, 3)
cp = crossprod(s)
y = fl(1:3)
backsolve(cp, y)




