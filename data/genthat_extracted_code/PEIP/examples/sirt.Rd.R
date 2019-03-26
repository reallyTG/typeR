library(PEIP)


### Name: sirt
### Title: SIRT Algorithm for sparse matrix inversion
### Aliases: sirt
### Keywords: misc

### ** Examples

set.seed(2015)
G = setDesignG()
###  Setup the true model.
mtruem=matrix(rep(0, 16*16), ncol=16,nrow=16);

mtruem[9,9]=1; mtruem[9,10]=1; mtruem[9,11]=1;
mtruem[10,9]=1; mtruem[10,11]=1;
mtruem[11,9]=1; mtruem[11,10]=1; mtruem[11,11]=1;
mtruem[2,3]=1; mtruem[2,4]=1;
mtruem[3,3]=1; mtruem[3,4]=1;

###  reshape the true model to be a vector
mtruev=as.vector(mtruem);

###  Compute the data.
dtrue=G %*% mtruev;

###  Add the noise.

d=dtrue+0.01*rnorm(length(dtrue));

msirt<-sirt(G,d,0.01,200)
par(mfrow=c(1,2))
imagesc(matrix(mtruem,16,16) , asp=1 , main="True Model" );

imagesc(matrix(msirt,16,16) , asp=1 , main="SIRT Solution" );




