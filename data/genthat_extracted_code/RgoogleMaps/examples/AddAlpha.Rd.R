library(RgoogleMaps)


### Name: AddAlpha
### Title: add alpha level to color that lacks one
### Aliases: AddAlpha

### ** Examples






#example: 


#require(RColorBrewer)


if (requireNamespace("RColorBrewer", quietly = TRUE)) {


  plotclr <- RColorBrewer::brewer.pal(8,"YlOrRd")


  plotclr = AddAlpha(plotclr,0.5)


} else {


  print("package RColorBrewer must be installed for this example")


}








