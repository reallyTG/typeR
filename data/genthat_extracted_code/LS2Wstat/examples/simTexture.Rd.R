library(LS2Wstat)


### Name: simTexture
### Title: simTextureulation function for LS2W processes.
### Aliases: simTexture
### Keywords: datagen

### ** Examples


X1 <- simTexture(128,K=1,imtype="S5",order=3)
X2 <- simTexture(128,K=1,imtype="NS4",fn=lincurve,a=.25,start=1,end=2)
X3 <- simTexture(128,K=1,imtype="NS5",sd=1.6,prop=.25)
X4 <- simTexture(128,K=1,imtype="NS6",sd=1.6,prop=.25)
X5 <- simTexture(128,K=1,imtype="NS7",sd=1.6,prop=.25,sd2=2.8, prop2=0.25, 
pos1=c(10,10),pos2="e")
        
# try plotting the images:

## Not run: image(plotmtx(X1[[1]]))




