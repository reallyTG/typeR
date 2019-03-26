library(pGPx)


### Name: dtt_fast
### Title: Rcpp implementation of Felzenszwalb distance transfom
### Aliases: dtt_fast

### ** Examples

# Create an image with a square
nc = 256
nr = 256
xx = matrix(FALSE,ncol=nc,nrow=nr)
xx[(nr/16):(nr/16*15-1),nc/16]<-rep(TRUE,nr/16*14)
xx[(nr/16):(nr/16*15-1),nc/16*15]<-rep(TRUE,nr/16*14)
xx[nr/16,(nc/16):(nc/16*15-1)]<-rep(TRUE,nc/16*14)
xx[nr/16*15,(nc/16):(nc/16*15-1)]<-rep(TRUE,nc/16*14)
# Compute Distance transform
zz<- dtt_fast(xx)
## No test: 
# Plot the results
image(xx,col=grey.colors(20), main="Original image")
image(zz,col=grey.colors(20), main="Distance transform")
## End(No test)



