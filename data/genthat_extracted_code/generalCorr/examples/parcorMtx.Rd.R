library(generalCorr)


### Name: parcorMtx
### Title: Matrix of generalized partial correlation coefficients, always
###   leaving out control variables, if any.
### Aliases: parcorMtx
### Keywords: biasing correlations, factor, partial ridge

### ** Examples

set.seed(234)
z=runif(10,2,11)# z is independently created
x=sample(1:10)+z/10  #x is partly indep and partly affected by z
y=1+2*x+3*z+rnorm(10)# y depends on x and z not vice versa
mtx=cbind(x,y,z)
parcorMtx(mtx)
 
   
## Not run: 
##D set.seed(34);x=matrix(sample(1:600)[1:99],ncol=3)
##D colnames(x)=c('V1', 'v2', 'V3')
##D parcorMtx(x)
## End(Not run)




