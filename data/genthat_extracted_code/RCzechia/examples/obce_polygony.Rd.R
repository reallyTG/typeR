library(RCzechia)


### Name: obce_polygony
### Title: Municipalities / communes (obce) as polygons
### Aliases: obce_polygony

### ** Examples

## No test: 
library(sf)
library(dplyr)

praha <- obce_polygony() %>%
   filter(NAZ_LAU1 == "Praha")

plot(praha, max.plot = 1)
## End(No test)





