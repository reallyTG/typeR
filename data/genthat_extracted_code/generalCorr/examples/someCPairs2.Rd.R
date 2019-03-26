library(generalCorr)


### Name: someCPairs2
### Title: Kernel causality computations admitting control variables
###   reporting a 7-column matrix, ver. 2
### Aliases: someCPairs2
### Keywords: SD1, SD2, SD3, SD4, causal correlations criteria, generalized

### ** Examples



## Not run: 
##D someCPairs2(mtcars[,1:3],ctrl=mtcars[4:5]) # first variable is mpg and effect on mpg is of interest
## End(Not run)

set.seed(234)
z=runif(10,2,11)# z is independently created
x=sample(1:10)+z/10  #x is somewhat indep and affected by z
y=1+2*x+3*z+rnorm(10)
w=runif(10)
x2=x;x2[4]=NA;y2=y;y2[8]=NA;w2=w;w2[4]=NA
someCPairs2(cbind(x2,y2), cbind(z,w2)) #yields x2 as correct cause





