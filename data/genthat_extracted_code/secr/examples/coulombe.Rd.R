library(secr)


### Name: housemouse
### Title: House mouse live trapping data
### Aliases: housemouse Coulombe housemouse.0 housemouse.ampm
###   housemouse.ampmh2h2 morning.0 morning.0h2 morning.b morning.h2
###   morning.h2h2 morning.t
### Keywords: datasets

### ** Examples


plot(housemouse, title = paste("Coulombe (1965), Mus musculus,",
    "California salt marsh"), border = 5, rad = 0.5,
    gridlines = FALSE)

morning <- subset(housemouse, occ = c(1,3,5,7,9))
summary(morning)

## drop 2 unknown-sex mice
known.sex <- subset(housemouse, !is.na(covariates(housemouse)$sex))

## reveal multiple captures
table(trap(housemouse), occasion(housemouse))

AIC(morning.0, morning.b, morning.t, morning.h2, morning.0h2, morning.h2h2)

## assess need to distinguish morning and afternoon samples
## Not run: 
##D housemouse.0 <- secr.fit (housemouse, buffer = 20)
##D housemouse.ampm <- secr.fit (housemouse, model = g0~tcov, buffer = 20,
##D     timecov = c(0,1,0,1,0,1,0,1,0,1))
##D AIC(housemouse.0, housemouse.ampm)
## End(Not run)



