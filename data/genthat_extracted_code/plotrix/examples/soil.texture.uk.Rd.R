library(plotrix)


### Name: soil.texture.uk
### Title: Soil texture triangle plot using UK conventions
### Aliases: soil.texture.uk
### Keywords: misc

### ** Examples

 soils.sw.percent<-data.frame(
  Sand=c(67,67,66,67,36,25,24,59,27,9,8,8,20,
  45,50,56,34,29,39,41,94,98,97,93,96,99),
  Silt=c(17,16,9,8,39,48,54,27,46,70,68,68,66,
  34,30,24,48,53,46,48,2,2,2,4,1,1),
  Clay=c(16,17,25,25,25,27,22,14,27,21,24,24,
  14,21,20,20,18,18,15,11,4,0,1,3,3,0))
 soils.sw.cols <- c(1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3,
  3, 3, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6)
 soils.sw.names <- c("Ardington","Astrop","Atrim",
  "Banbury","Beacon","Beckfoot")
 soil.texture.uk(soils.sw.percent,
  main = "Ternary Diagram for Some Soils from South West England",
  col.lines = "black", col.names = "black", show.grid = TRUE,
  col.grid = "blue", lty.grid = 2,  pch = 16, cex = 1.0,
  col.symbols = soils.sw.cols, h1 = NA, h3 = NA, t1 = NA,
  t3 = NA , lwduk = 2, xpos = NA, ypos = NA,
  snames = NA, cexuk = 1.1)
 legend("topleft", legend = soils.sw.names, col = 1:max(soils.sw.cols),
  pch = 16, cex = 1.1, title = "Location", bty = "n")



