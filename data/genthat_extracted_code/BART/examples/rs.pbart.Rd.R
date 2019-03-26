library(BART)


### Name: rs.pbart
### Title: BART for dichotomous outcomes with parallel computation and
###   stratified random sampling
### Aliases: rs.pbart
### Keywords: nonparametric tree regression nonlinear

### ** Examples


##simulate from Friedman's five-dimensional test function
##Friedman JH. Multivariate adaptive regression splines
##(with discussion and a rejoinder by the author).
##Annals of Statistics 1991; 19:1-67.

f = function(x) #only the first 5 matter
    sin(pi*x[ , 1]*x[ , 2]) + 2*(x[ , 3]-.5)^2+x[ , 4]+0.5*x[ , 5]-1.5

sigma = 1.0  #y = f(x) + sigma*z where z~N(0, 1)
k = 50       #number of covariates
thin = 25
ndpost = 2500
nskip = 100
C = 10
m = 10
n = 10000

set.seed(12)
x.train=matrix(runif(n*k), n, k)
Ey.train = f(x.train)
y.train=(Ey.train+sigma*rnorm(n)>0)*1
table(y.train)/n

x <- x.train
x4 <- seq(0, 1, length.out=m)

for(i in 1:m) {
    x[ , 4] <- x4[i]

    if(i==1) x.test <- x
    else x.test <- rbind(x.test, x)
}

## parallel::mcparallel/mccollect do not exist on windows
if(.Platform$OS.type=='unix') {
##test BART with token run to ensure installation works
    post = rs.pbart(x.train, y.train, 
                C=C, mc.cores=4, keepevery=1,
                seed=99, ndpost=1, nskip=1)
}

## Not run: 
##D post = rs.pbart(x.train, y.train, x.test=x.test,
##D                 C=C, mc.cores=8, keepevery=thin,
##D                 seed=99, ndpost=ndpost, nskip=nskip)
##D str(post)
##D 
##D par(mfrow=c(2, 2))
##D 
##D M <- nrow(post$yhat.test)
##D pred <- matrix(nrow=M, ncol=10)
##D 
##D for(i in 1:m) {
##D     h <- (i-1)*n+1:n
##D     pred[ , i] <- apply(pnorm(post$yhat.test[ , h]), 1, mean)
##D }
##D 
##D pred <- apply(pred, 2, mean)
##D 
##D plot(x4, qnorm(pred), xlab=expression(x[4]),
##D      ylab='partial dependence function', type='l')
##D 
##D i <- floor(seq(1, n, length.out=10))
##D j <- seq(-0.5, 0.4, length.out=10)
##D for(h in 1:10) {
##D     auto.corr <- acf(post$yhat.shard[ , i[h]], plot=FALSE)
##D     if(h==1) {
##D         max.lag <- max(auto.corr$lag[ , 1, 1])
##D         plot(1:max.lag+j[h], auto.corr$acf[1+(1:max.lag), 1, 1],
##D              type='h', xlim=c(0, max.lag+1), ylim=c(-1, 1),
##D              ylab='auto-correlation', xlab='lag')
##D     }
##D     else 
##D         lines(1:max.lag+j[h], auto.corr$acf[1+(1:max.lag), 1, 1],
##D               type='h', col=h)
##D }
##D 
##D for(j in 1:10) {
##D     if(j==1)
##D         plot(pnorm(post$yhat.shard[ , i[j]]),
##D              type='l', ylim=c(0, 1),
##D              sub=paste0('N:', n, ', k:', k),
##D              ylab=expression(Phi(f(x))), xlab='m')
##D     else
##D         lines(pnorm(post$yhat.shard[ , i[j]]),
##D               type='l', col=j)
##D }
##D 
##D geweke <- gewekediag(post$yhat.shard)
##D 
##D j <- -10^(log10(n)-1)
##D plot(geweke$z, pch='.', cex=2, ylab='z', xlab='i',
##D      sub=paste0('N:', n, ', k:', k),
##D      xlim=c(j, n), ylim=c(-5, 5))
##D lines(1:n, rep(-1.96, n), type='l', col=6)
##D lines(1:n, rep(+1.96, n), type='l', col=6)
##D lines(1:n, rep(-2.576, n), type='l', col=5)
##D lines(1:n, rep(+2.576, n), type='l', col=5)
##D lines(1:n, rep(-3.291, n), type='l', col=4)
##D lines(1:n, rep(+3.291, n), type='l', col=4)
##D lines(1:n, rep(-3.891, n), type='l', col=3)
##D lines(1:n, rep(+3.891, n), type='l', col=3)
##D lines(1:n, rep(-4.417, n), type='l', col=2)
##D lines(1:n, rep(+4.417, n), type='l', col=2)
##D text(c(1, 1), c(-1.96, 1.96), pos=2, cex=0.6, labels='0.95')
##D text(c(1, 1), c(-2.576, 2.576), pos=2, cex=0.6, labels='0.99')
##D text(c(1, 1), c(-3.291, 3.291), pos=2, cex=0.6, labels='0.999')
##D text(c(1, 1), c(-3.891, 3.891), pos=2, cex=0.6, labels='0.9999')
##D text(c(1, 1), c(-4.417, 4.417), pos=2, cex=0.6, labels='0.99999')
##D 
##D par(mfrow=c(1, 1))
##D 
##D ##dev.copy2pdf(file='geweke.rs.pbart.pdf')
## End(Not run)



