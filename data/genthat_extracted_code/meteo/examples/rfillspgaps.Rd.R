library(meteo)


### Name: rfillspgaps
### Title: Close gaps of a grid or raster Layer data
### Aliases: rfillspgaps

### ** Examples

   library(raster)
   data(nlmodis20110712)
   data(NLpol)
   
   # spplot(nlmodis20110712, col.regions=bpy.colors())
   # fill spatial gaps
   r=rfillspgaps(nlmodis20110712,NLpol)
   # spplot(r, col.regions=bpy.colors())
  



