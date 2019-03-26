library(BART)


### Name: gewekediag
### Title: Geweke's convergence diagnostic
### Aliases: gewekediag
### Keywords: convergence diagnostics

### ** Examples


## load survival package for the advanced lung cancer example
data(lung)

group <- -which(is.na(lung[ , 7])) ## remove missing row for ph.karno
times <- lung[group, 2]   ##lung$time
delta <- lung[group, 3]-1 ##lung$status: 1=censored, 2=dead
                          ##delta: 0=censored, 1=dead

## this study reports time in days rather than months like other studies
## coarsening from days to months will reduce the computational burden
times <- ceiling(times/30)

summary(times)
table(delta)

x.train <- as.matrix(lung[group, c(4, 5, 7)]) ## matrix of observed covariates

## lung$age:        Age in years
## lung$sex:        Male=1 Female=2
## lung$ph.karno:   Karnofsky performance score (dead=0:normal=100:by=10)
##                  rated by physician

dimnames(x.train)[[2]] <- c('age(yr)', 'M(1):F(2)', 'ph.karno(0:100:10)')

summary(x.train[ , 1])
table(x.train[ , 2])
table(x.train[ , 3])

x.test <- matrix(nrow=84, ncol=3) ## matrix of covariate scenarios

dimnames(x.test)[[2]] <- dimnames(x.train)[[2]]

i <- 1

for(age in 5*(9:15)) for(sex in 1:2) for(ph.karno in 10*(5:10)) {
    x.test[i, ] <- c(age, sex, ph.karno)
    i <- i+1
}

## Not run: 
##D     set.seed(99)
##D     post <- surv.bart(x.train=x.train, times=times, delta=delta, x.test=x.test)
##D     ## in the interest of time, consider speeding it up by parallel processing
##D     ## run "mc.cores" number of shorter MCMC chains in parallel processes
##D     ## post <- mc.surv.bart(x.train=x.train, times=times, delta=delta,
##D     ##                      x.test=x.test, mc.cores=8, seed=99)
##D 
##D     N <- nrow(x.test)
##D 
##D     K <- post$K
##D     ## select 10 lung cancer patients uniformly spread out over the data set
##D     h <- seq(1, N*K, floor(N/10)*K)
##D 
##D     for(i in h) {
##D         post.mcmc <- post$yhat.test[ , (i-1)+1:K]
##D         z <- gewekediag(post.mcmc)$z
##D         y <- max(c(4, abs(z)))
##D 
##D         ## plot the z scores vs. time for each patient
##D         if(i==1) plot(post$times, z, ylim=c(-y, y), type='l',
##D                       xlab='t', ylab='z')
##D         else lines(post$times, z, type='l')
##D     }
##D     ## add two-sided alpha=0.05 critical value lines
##D     lines(post$times, rep(-1.96, K), type='l', lty=2)
##D     lines(post$times, rep( 1.96, K), type='l', lty=2)
##D 
## End(Not run)




