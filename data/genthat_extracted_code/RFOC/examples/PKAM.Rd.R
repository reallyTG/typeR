library(RFOC)


### Name: PKAM
### Title: P and T-axes data from the Harvard CMT catalog
### Aliases: PKAM
### Keywords: datasets

### ** Examples

data(PKAM)
## 

######  plot the locations:
plot( RPMG::fmod(PKAM$LONS, 360), PKAM$LATS)
######  

  PlotTernfoc(PKAM$h,PKAM$v,x=0, y=0, siz=1, fcols='black', add=FALSE,
LAB=TRUE)

######  change the colors for the plot

acols = rainbow(7)
fcols = acols[PKAM$IFcol]

######  


 PlotTernfoc(PKAM$h,PKAM$v,x=0, y=0, siz=1, fcols=fcols, add=FALSE,
LAB=TRUE)








