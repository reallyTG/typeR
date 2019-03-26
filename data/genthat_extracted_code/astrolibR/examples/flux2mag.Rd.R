library(astrolibR)


### Name: flux2mag
### Title: Convert from flux (ergs/s/cm^2/A) to astronomical magnitudes
### Aliases: flux2mag
### Keywords: misc

### ** Examples

flux2mag(3e-17)   #  returns 20.21

ytext <- expression(Flux~~ (erg/s~cm^2~A))
plot(seq(2000,5000,length=100), flux2mag(seq(3e-17,3e-16,length=100)), pch=20)




