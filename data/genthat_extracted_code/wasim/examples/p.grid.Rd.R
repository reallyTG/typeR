library(wasim)


### Name: p.grid
### Title: Read and plot a grid-file output by WaSiM
### Aliases: p.grid read.grid
### Keywords: hplot utilities

### ** Examples

  unzip(system.file("weisseritz.zip", package="wasim"))
  sd.grid <- read.grid( file= "weisseritz/sd__ww100.grd")  # Datumsreihe heisst jetzt d.datum
  p.grid(sd.grid, 
        color.palette=topo.colors,
	      zlim=c(-20,20),
        main="Saturation deficit at the Weisseritz")



