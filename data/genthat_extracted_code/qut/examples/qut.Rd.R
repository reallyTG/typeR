library(qut)


### Name: qut
### Title: Fit a low dimensional GLM or Square-root lasso using the
###   Quantile Universal Threshold
### Aliases: qut

### ** Examples

set.seed(1234)
X=matrix(rnorm(50*500),50,500)
beta=c(rep(10,5),rep(0,500-5))
y=X %*% beta+rnorm(50)

outqut=qut(y,X,type='glmnet',family=gaussian,sigma=1) #Fitting with qut
betaqut=outqut$beta[-1]

outcv=cv.glmnet(X,y,family='gaussian') #fitting with Cross-Validation
betacv=coef(outcv$glmnet.fit,s=outcv$lambda.min)[-1]

results=rbind( 	c(sum(betaqut[1:5]!=0),sum(betaqut[-(1:5)]!=0)),
				c(sum( betacv[1:5]!=0), sum(betacv[-(1:5)]!=0)) )
colnames(results)=c('True Positive','False Positive')
rownames(results)=c('qut','cv')

print(results)




