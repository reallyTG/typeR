library(hexbin)


### Name: hexTapply
### Title: Apply function to data from each hexagon bin.
### Aliases: hexTapply
### Keywords: dplot utilities

### ** Examples

  data(NHANES)
  hbin<-hexbin(log(NHANES$Diet.Iron+1),log(NHANES$BMI),xbins=25,IDs=TRUE)
  hvp<-plot(hbin)
  mtrans<-hexTapply(hbin,NHANES$Transferin,median,na.rm=TRUE)
  pushHexport(hvp$plot.vp)
  grid.hexagons(hbin,style='lattice',pen=0,border='red',use.count=FALSE,
cell.at=mtrans)

  
  



