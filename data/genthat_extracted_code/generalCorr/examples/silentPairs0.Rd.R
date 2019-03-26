library(generalCorr)


### Name: silentPairs0
### Title: Older version, kernel causality weighted sum allowing control
###   variables
### Aliases: silentPairs0
### Keywords: SD1, SD2, SD3, SD4, causal correlations criteria, generalized

### ** Examples



## Not run: 
##D options(np.messages=FALSE)
##D colnames(mtcars[2:ncol(mtcars)])
##D silentPairs0(mtcars[,1:3],ctrl=mtcars[,4:5]) # mpg paired with others
## End(Not run)

options(np.messages=FALSE)
set.seed(234)
z=runif(10,2,11)# z is independently created
x=sample(1:10)+z/10 #x is somewhat indep and affected by z
y=1+2*x+3*z+rnorm(10)
w=runif(10)
x2=x;x2[4]=NA;y2=y;y2[8]=NA;w2=w;w2[4]=NA
silentPairs0(mtx=cbind(x2,y2), ctrl=cbind(z,w2))





