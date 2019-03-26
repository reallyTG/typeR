library(descomponer)


### Name: descomponer
### Title: Time series decomposition
### Aliases: descomponer
### Keywords: smooth

### ** Examples

data(ipi)
datos <- descomponer(ipi,12,2)
plot(ts(datos$datos,frequency=12))



