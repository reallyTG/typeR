library(funchir)


### Name: funchir-plot
### Title: Simulcast Plot Wrappers
### Aliases: pdf2 png2 dev.off2 tile.axes rel_coord

### ** Examples

  smpl <- rnorm(100)
  
  ## Not run: 
##D     #Runs in RStudio
##D     pdf2(file.path(temp.dir(), 'test.pdf')) 
##D     hist(smpl)
##D     dev.off2()
##D 
##D     png2(file.path(temp.dir(), 'test.png'))
##D     hist(smpl)
##D     dev.off2(typ="png")
##D   
## End(Not run)

  par(mfrow = c(2, 1), mar = c(0, 0, 0, 0), oma=c(5, 4, 4, 2) + .1)
  for (ii in 1:2){
    hist(smpl[sample(length(smpl), 100, rep = TRUE)], xaxt = "n", yaxt = "n")
    tile.axes(ii, 2, 1)
  }



