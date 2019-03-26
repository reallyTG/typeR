library(openCR)


### Name: openCR.design
### Title: Design Data for Open population Models
### Aliases: openCR.design
### Keywords: manip

### ** Examples


## this happens automatically in openCR.fit
ovenCH1 <- join(reduce(ovenCH, by = "all", newtraps=list(1:44)))

openCR.design (ovenCH1, models = list(p = ~1, phi = ~session),
    interval = c(1,1,1,1), type = "CJS")




