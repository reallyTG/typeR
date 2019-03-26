library(BART)


### Name: Alligator
### Title: American alligator Food Choice
### Aliases: Alligator
### Keywords: datasets

### ** Examples


data(Alligator)
     
## nnet::multinom Multinomial logit model fit with neural nets
fit <- multinom(food ~ lake+size+sex, data=Alligator, weights=count)

summary(fit$fitted.values)
## 1=bird, 2=fish, 3=invert, 4=other, 5=reptile

(L=length(Alligator$count))
(N=sum(Alligator$count))
y.train=integer(N)
x.train=matrix(nrow=N, ncol=3)
x.test=matrix(nrow=L, ncol=3)
k=1
for(i in 1:L) {
    x.test[i, ]=as.integer(
        c(Alligator$lake[i], Alligator$size[i], Alligator$sex[i]))
    if(Alligator$count[i]>0)
        for(j in 1:Alligator$count[i]) {
            y.train[k]=as.integer(Alligator$food[i])
            x.train[k, ]=as.integer(
                c(Alligator$lake[i], Alligator$size[i], Alligator$sex[i]))
            k=k+1
        }
}
table(y.train)
##test mbart with token run to ensure installation works
set.seed(99)
check = mbart(x.train, y.train, nskip=1, ndpost=1)

## Not run: 
##D set.seed(99)
##D check = mbart(x.train, y.train, nskip=1, ndpost=1)
##D post=mbart(x.train, y.train, x.test)
##D 
##D ##post=mc.mbart(x.train, y.train, x.test, mc.cores=8, seed=99)
##D ##check=predict(post, x.test, mc.cores=8)
##D ##print(cor(post$prob.test.mean, check$prob.test.mean)^2)
##D 
##D par(mfrow=c(3, 2))
##D K=5
##D for(j in 1:5) {
##D     h=seq(j, L*K, K)
##D     print(cor(fit$fitted.values[ , j], post$prob.test.mean[h])^2)
##D     plot(fit$fitted.values[ , j], post$prob.test.mean[h],
##D          xlim=0:1, ylim=0:1,
##D          xlab=paste0('NN: Est. Prob. j=', j),
##D          ylab=paste0('BART: Est. Prob. j=', j))
##D     abline(a=0, b=1)
##D }
##D par(mfrow=c(1, 1))
##D 
##D L=16
##D x.test=matrix(nrow=L, ncol=3)
##D k=1
##D for(size in 1:2)
##D     for(sex in 1:2)
##D         for(lake in 1:4) {
##D             x.test[k, ]=c(lake, size, sex)
##D             k=k+1
##D         }
##D x.test
##D 
##D ## two sizes: 1=large: >2.3m, 2=small: <=2.3m
##D pred=predict(post, x.test)
##D ##pred=predict(post, x.test, mc.cores=8)
##D ndpost=nrow(pred$prob.test)
##D 
##D size.test=matrix(nrow=ndpost, ncol=K*2)
##D for(i in 1:K) {
##D     j=seq(i, L*K/2, K) ## large
##D     size.test[ , i]=apply(pred$prob.test[ , j], 1, mean)
##D     j=j+L*K/2 ## small
##D     size.test[ , i+K]=apply(pred$prob.test[ , j], 1, mean)
##D }
##D size.test.mean=apply(size.test, 2, mean)
##D size.test.025=apply(size.test, 2, quantile, probs=0.025)
##D size.test.975=apply(size.test, 2, quantile, probs=0.975)
##D 
##D plot(factor(1:K, labels=c('bird', 'fish', 'invert', 'other', 'reptile')),
##D      rep(1, K), col=1:K, type='n', lwd=1, lty=0,
##D              xlim=c(1, K), ylim=c(0, 0.5), ylab='Prob.',
##D      sub="Multinomial BART\nFriedman's partial dependence function")
##D points(1:K, size.test.mean[1:K+K], col=1)
##D lines(1:K, size.test.025[1:K+K], col=1, lty=2)
##D lines(1:K, size.test.975[1:K+K], col=1, lty=2)
##D points(1:K, size.test.mean[1:K], col=2)
##D lines(1:K, size.test.025[1:K], col=2, lty=2)
##D lines(1:K, size.test.975[1:K], col=2, lty=2)
##D ## legend('topright', legend=c('Small', 'Large'),
##D ##        pch=1, col=1:2)
##D 
## End(Not run)



