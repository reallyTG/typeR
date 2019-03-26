library(fence)


### Name: adaptivefence
### Title: Adaptive Fence model selection
### Aliases: adaptivefence

### ** Examples

## Not run: 
##D require(fence)
##D 
##D #### Example 1 #####
##D data(iris)
##D full = Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width + (1|Species)
##D test_af = fence.lmer(full, iris)
##D plot(test_af)
##D test_af$sel_model
##D 
##D #### Example 2 #####
##D r =1234; set.seed(r)  
##D p=8; n=150; rho = 0.6
##D id = rep(1:50,each=3)
##D R = diag(p)
##D for(i in 1:p){
##D   for(j in 1:p){
##D      R[i,j] = rho^(abs(i-j))
##D   }
##D } 
##D R = 1*R
##D x=mvrnorm(n, rep(0, p), R)  # all x's are time-varying dependence #
##D colnames(x)=paste('x',1:p, sep='')
##D tbetas = c(0,0.5,1,0,0.5,1,0,0.5)  # non-zero beta 2,3,5,6,8
##D epsilon = rnorm(150)
##D y = x%*%tbetas + epsilon
##D colnames(y) = 'y'
##D data = data.frame(cbind(x,y,id))
##D full = y ~ x1+x2+x3+x4+x5+x6+x7+x8+(1|id)
##D #X = paste('x',1:p, sep='', collapse='+')
##D #full = as.formula(paste('y~',X,'+(1|id)', sep=""))  #same as previous one
##D fence_obj = fence.lmer(full,data)   # it takes 3-5 min #
##D plot(fence_obj)
##D fence_obj$sel_model
## End(Not run)



