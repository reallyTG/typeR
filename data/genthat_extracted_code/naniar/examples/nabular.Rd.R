library(naniar)


### Name: nabular
### Title: Convert data into nabular form by binding shade to it
### Aliases: nabular

### ** Examples


aq_nab <- nabular(airquality)
aq_s <- bind_shadow(airquality)

all.equal(aq_nab, aq_s)




