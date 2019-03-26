library(distrom)


### Name: dmr
### Title: Distributed Multinomial Regression
### Aliases: dmr distrom predict.dmr coef.dmr

### ** Examples


library(MASS)
data(fgl)

## make your cluster 
## FORK is faster but memory heavy, and doesn't work on windows.
cl <- makeCluster(2,type=ifelse(.Platform$OS.type=="unix","FORK","PSOCK")) 
print(cl)

## fit in parallel
fits <- dmr(cl, fgl[,1:9], fgl$type, verb=1)

## its good practice stop the cluster once you're done
stopCluster(cl)

## Individual Poisson model fits and AICc selection
par(mfrow=c(3,2))
for(j in 1:6){
	plot(fits[[j]])
	mtext(names(fits)[j],font=2,line=2) }

##  AICc model selection
B <- coef(fits)

## Fitted probability by true response
par(mfrow=c(1,1))
P <- predict(B, fgl[,1:9], type="response")
boxplot(P[cbind(1:214,fgl$type)]~fgl$type, 
	ylab="fitted prob of true class")





