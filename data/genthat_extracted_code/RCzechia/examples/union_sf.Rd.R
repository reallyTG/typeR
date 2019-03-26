library(RCzechia)


### Name: union_sf
### Title: Aggregate Polygons in a 'sf' Object
### Aliases: union_sf

### ** Examples

## No test: 

NUTS3 <- union_sf(okresy(), "KOD_CZNUTS3")
  # assembles NUTS3 regions from LAU1 regions of Czech Republic = equivalent to kraje() in geometry

plot(NUTS3)

## End(No test)



