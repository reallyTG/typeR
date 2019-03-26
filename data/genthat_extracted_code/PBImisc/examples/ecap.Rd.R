library(PBImisc)


### Name: ecap
### Title: Epidemiology of Allergic Disease in Poland
### Aliases: ecap
### Keywords: ecap

### ** Examples

data(ecap)
library(lattice)
xyplot(PNIF~age|city, data=ecap, type=c("p","g","smooth"))



