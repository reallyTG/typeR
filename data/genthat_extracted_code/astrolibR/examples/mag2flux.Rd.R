library(astrolibR)


### Name: mag2flux
### Title: Convert from astronomical magnitudes to flux (ergs/s/cm^2/A)
### Aliases: mag2flux
### Keywords: misc

### ** Examples

mag2flux(19.8)

ytext <- expression(Flux~~ (erg/s~cm^2~A))
plot(seq(2000,5000,length=100), flux2mag(seq(15, 20,length=100)), pch=20)




