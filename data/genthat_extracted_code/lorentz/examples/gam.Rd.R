library(lorentz)


### Name: gam
### Title: Gamma correction
### Aliases: speed speed.3vel speed.4vel speedsquared gam gam.3vel gam.4vel
###   gam.default gamm1 gamm1.3vel gamm1.4vel gamm1.default

### ** Examples


gam(seq(from=0,by=0.1,len=10))
gam(r3vel(6,0.7))


x <- as.3vel(c(0.1,0.4,0.5))
speed(x)

gam(speed(x))  # works, but slow and inaccurate
gam(x)         # recommended: avoids needless coercion


sol(299792458)
sound <- 343 # speed of sound in SI
gam(sound)
gam(sound)-1  
gamm1(sound)   # gamm1() gives much higher precision

snail <- as.3vel(c(0.00275,0,0)) # even the world's fastest snail...
gamm1(snail)                     # ...has only a small relativistic correction

sol(1)




