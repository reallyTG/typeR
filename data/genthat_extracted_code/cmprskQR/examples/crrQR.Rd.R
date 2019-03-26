library(cmprskQR)


### Name: crrQR
### Title: Competing Risks Quantile Regression
### Aliases: crrQR print.crrQR
### Keywords: survival

### ** Examples

# simulated data to test 
set.seed(10)
ftime <- rexp(200)
fstatus <- sample(0:2,200,replace=TRUE)
X <- matrix(runif(600),nrow=200)
dimnames(X)[[2]] <- c('x1','x2','x3')
#compute model
print(z <- crrQR(ftime,fstatus,X))
summary(z)
# predict and plot cumulative incedences
reference <- as.matrix(rbind(c(.1,.5,.8),c(.1,.5,.2)))
dimnames(reference)[[2]] <- c('x1','x2','x3') 
z.p <- predict(z,reference)
print(z.p)
plot(z.p,lty=1,color=2:3)
crrQR(ftime,fstatus,X,failcode=2)



