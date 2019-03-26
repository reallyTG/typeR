library(languageR)


### Name: nessdemog
### Title: Frequency spectrum for -ness in the context-governed BNC
### Aliases: nessdemog
### Keywords: datasets

### ** Examples

data(nessdemog)
library(zipfR)
nessdemog.spc = spc(m=nessdemog$m, Vm = nessdemog$Vm)
plot(nessdemog.spc)



