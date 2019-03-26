library(ggtern)


### Name: theme_showgrid
### Title: Show or Hide Grid
### Aliases: theme_showgrid theme_nogrid_minor theme_tern_nogrid_minor
###   theme_hidegrid_minor theme_showgrid_minor theme_nogrid_major
###   theme_tern_nogrid_major theme_nogrid theme_tern_nogrid theme_hidegrid
###   theme_showgrid_major theme_hidegrid_major

### ** Examples

  #Load data
  data(Feldspar)
  plot <- ggtern(data=Feldspar,aes(Ab,An,Or)) + 
          geom_point()   + #Layer 
          theme_bw()       #For clarity
  plot
  plot = plot + theme_hidegrid(); plot
  plot + theme_showgrid()



