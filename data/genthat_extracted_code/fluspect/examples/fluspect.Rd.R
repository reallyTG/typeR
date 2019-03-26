library(fluspect)


### Name: fluspect
### Title: fluspect
### Aliases: fluspect

### ** Examples

leafbio <- data.frame(Cab = 70, Cca = 30, Cw = 0.013, Cdm = 0.024, Cs = 0.0, N = 4.09, fqe = 0.02)
leafopt <- fluspect(leafbio)
plot(leafopt$refl)




