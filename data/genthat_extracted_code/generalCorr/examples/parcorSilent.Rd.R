library(generalCorr)


### Name: parcorSilent
### Title: Silently compute generalized (ridge-adjusted) partial
###   correlation coefficients from matrix R*.
### Aliases: parcorSilent
### Keywords: biasing correlations, factor, partial ridge

### ** Examples

set.seed(234)
z=runif(10,2,11)# z is independently created
x=sample(1:10)+z/10  #x is partly indep and partly affected by z
y=1+2*x+3*z+rnorm(10)# y depends on x and z not vice versa
mtx=cbind(x,y,z)
g1=gmcmtx0(mtx)
parcor_ijkOLD(g1,1,2) # ouji> ouij implies i=x is the cause of j=y
parcor_ridg(g1,idep=1)
parcorSilent(g1,idep=1)
 
   
## Not run: 
##D set.seed(34);x=matrix(sample(1:600)[1:99],ncol=3)
##D colnames(x)=c('V1', 'v2', 'V3')
##D gm1=gmcmtx0(x)
##D parcorSilent(gm1, idep=1)
## End(Not run)




