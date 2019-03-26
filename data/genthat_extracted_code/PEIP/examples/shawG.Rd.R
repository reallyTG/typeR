library(PEIP)


### Name: shawG
### Title: Shaw Model of Slit Diffraction
### Aliases: shawG
### Keywords: misc

### ** Examples

n = 20
G = shawG(n,n)

spike = rep(0,n)
spike[10] = 1

dspiken = G %*%  spike

plot(dspiken)






