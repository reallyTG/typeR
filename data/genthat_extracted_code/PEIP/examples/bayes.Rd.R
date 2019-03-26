library(PEIP)


### Name: bayes
### Title: Bayes Inversion
### Aliases: bayes
### Keywords: misc

### ** Examples


## Not run: 
##D set.seed(2015)
##D G = setDesignG()
##D ### ##D 
##D mtruem=matrix(rep(0, 16*16), ncol=16,nrow=16);
##D 
##D mtruem[9,9]=1; mtruem[9,10]=1; mtruem[9,11]=1;
##D mtruem[10,9]=1; mtruem[10,11]=1;
##D mtruem[11,9]=1; mtruem[11,10]=1; mtruem[11,11]=1;
##D mtruem[2,3]=1; mtruem[2,4]=1;
##D mtruem[3,3]=1; mtruem[3,4]=1;
##D 
##D ### ##D 
##D mtruev=as.vector(mtruem);
##D imagesc(matrix(mtruem,16,16) , asp=1 , main="True Model" );
##D 
##D 
##D matrix(mtruem,16,16) , asp=1 , main="True Model" )
##D 
##D 
##D ### ##D 
##D dtrue=G %*% mtruev;
##D 
##D ### ##D 
##D d=dtrue+0.01*rnorm(length(dtrue));
##D covd = 0.1*diag( nrow=length(d) )
##D covm = 1*diag( nrow=dim(G)[2] )
## End(Not run)



