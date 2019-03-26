library(LS2Wstat)


### Name: compareImages
### Title: Assesses whether two textured images are the same texture.
### Aliases: compareImages
### Keywords: manip

### ** Examples


# create two images to be compared:
X1<-simTexture(32,K=1,imtype="S1")[[1]]
X2<-simTexture(32,K=1,imtype="S1", sd=1.6)[[1]]
                             
# use the test to compare them:

test<-compareImages(X1,X2,nsamples=100, smooth=FALSE)




