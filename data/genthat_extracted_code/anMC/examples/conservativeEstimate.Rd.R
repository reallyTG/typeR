library(anMC)


### Name: conservativeEstimate
### Title: Computationally efficient conservative estimate
### Aliases: conservativeEstimate

### ** Examples

if (!requireNamespace("DiceKriging", quietly = TRUE)) {
stop("DiceKriging needed for this example to work. Please install it.",
     call. = FALSE)
}
# Compute conservative estimate of excursion set of testfun below threshold
# Initialize
testfun<-function(x){return(((3*x^2+7*x-3)*exp(-1*(x)^2)*cos(5*pi*x^2)-1.2*x^2))}
mDet<- 1500

# Uniform design points
set.seed(42)
doe<-runif(n = 8)
res<-testfun(doe)
threshold<-0
# create km
smallKm <- DiceKriging::km(design = matrix(doe,ncol=1),
response = res,covtype = "matern5_2",coef.trend = -1,coef.cov = c(0.05),coef.var = 1.1)
# prediction at newdata
newdata<-data.frame(matrix(seq(0,1,,mDet),ncol=1)); colnames(newdata)<-colnames(smallKm@X)
pred<-DiceKriging::predict.km(object = smallKm,newdata = newdata,type = "UK",cov.compute = TRUE)

## Not run: 
##D # Plot (optional)
##D plot(seq(0,1,,mDet),pred$mean,type='l')
##D points(doe,res,pch=10)
##D abline(h = threshold)
##D lines(seq(0,1,,mDet),pred$mean+pred$sd,lty=2,col=1)
##D lines(seq(0,1,,mDet),pred$mean-pred$sd,lty=2,col=1)
## End(Not run)
# Compute the coverage function
pn<-pnorm((threshold-pred$mean)/pred$sd)

## Not run: 
##D pred$cov <- pred$cov + 1e-7*diag(nrow = nrow(pred$cov),ncol = ncol(pred$cov))
##D CE<-conservativeEstimate(alpha = 0.95,pred = pred,design = as.matrix(newdata),
##D threshold = threshold,type = "<",verb=1, pn=pn,algo = "ANMC")
##D points(newdata[CE$set,],rep(-0.1,mDet)[CE$set],col=4,pch="-",cex=2)
## End(Not run)



