library(MAclinical)


### Name: testclass
### Title: Evaluating a classification method based on several learning
###   subsets
### Aliases: testclass
### Keywords: multivariate

### ** Examples

# load MAclinical library
# library(MAclinical)

# Generate data
x<-matrix(rnorm(20000),100,200)
z<-matrix(rnorm(500),100,5)
y<-sample(0:1,100,replace=TRUE)

# Generate learningsets (5-fold CV)
my.learningsets<-generate.learningsets(n=100,method="CV",fold=5)

# Evaluate accuracy of the PLS-PV-RF method
my.eval<-testclass(x=x,y=y,z=z,learningsets=my.learningsets,classifier=plsrf_xz_pv,ncomp=5,
varsel=NULL,nbgene=NULL,fold=10)

# With variable selection
my.varsel<-matrix(0,5,200)
for (i in 1:5)
 {
 my.varsel[i,]<-order(abs(studentt.stat(X=x[my.learningsets[i,],],
 L=y[my.learningsets[i,]]+1)),decreasing=TRUE)
 }

my.eval<-testclass(x=x,y=y,z=z,learningsets=my.learningsets,classifier=plsrf_xz_pv,ncomp=5,
varsel=my.varsel,nbgene=15,fold=10)




