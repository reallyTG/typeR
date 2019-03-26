library(spatstat)


### Name: Fest
### Title: Estimate the Empty Space Function or its Hazard Rate
### Aliases: Fest Fhazard
### Keywords: spatial nonparametric

### ** Examples

   Fc <- Fest(cells, 0.01)

   # Tip: don't use F for the left hand side!
   # That's an abbreviation for FALSE

   plot(Fc)

   # P-P style plot
   plot(Fc, cbind(km, theo) ~ theo)

   # The empirical F is above the Poisson F
   # indicating an inhibited pattern

   ## Not run: 
##D    plot(Fc, . ~ theo)
##D    plot(Fc, asin(sqrt(.)) ~ asin(sqrt(theo)))
##D    
## End(Not run)
   ## Don't show: 
   Fh <- Fhazard(cells)
   
## End(Don't show)



