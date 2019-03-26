library(rdtLite)


### Name: prov.init
### Title: Provenance Collection Functions
### Aliases: prov.init prov.save prov.quit prov.run prov.source

### ** Examples

## Not run: prov.run ("script.R")
## Not run: prov.source ("script.R")
prov.init()
a <- 1
b <- 2
prov.save()
ab <- a + b
prov.quit()



