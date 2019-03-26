library(forestChange)


### Name: EBVmetric
### Title: EBV metric
### Aliases: EBVmetric

### ** Examples

EBVmetric(NULL)
## Lets change mpio = NULL by a GADM unit: e.g., the municipality
## of 'Uribia' in Colombia and compute fractal dimensions from
## year 10 to year 17:
 ## No test: 
 mpio <- 'Uribia'
 gadm <- FCPolygon(mpio, level = 2)
 smet <- EBVmetric(gadm, met = 'frac', year = 10:17)
 plot(smet)
 
## End(No test)



