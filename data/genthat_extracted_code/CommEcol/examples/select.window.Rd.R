library(CommEcol)


### Name: select.window
### Title: Select cells inside a defined window of a gridded dataset
### Aliases: select.window

### ** Examples

x<-rep(1:5,each=5)
y<-rep(1:5,5)
spp<-matrix(1:100,25,4)
colnames(spp)<-c("sp1","sp2","sp3","sp4")
xyspp<-cbind(x,y,spp)
resu<-select.window(xf=3, yf=3, radius=1.1, xydata=xyspp)
resu

plot(x,y) # maintain the plot window open.
points(resu[,1:2],col=2,cex=2 ) # cells of the selected window in red.

#A reduced number of cells will be selected for focal cells located in margins.
resu<-select.window(xf=5, yf=5, radius=1.1, xydata=xyspp)
plot(x,y) # maintain the plot window open.
points(resu[,1:2],col=2,cex=2 ) # cells of the selected window in red.

# Unrecorded species in the selected window are removed from resulting dataframe (or matrix):
spp<-matrix(rep(0:1,each=50),25,4)
colnames(spp)<-c("sp1","sp2","sp3","sp4")
xyspp<-cbind(x,y,spp)
select.window(xf=3, yf=3, radius=1.1, xydata=xyspp)



