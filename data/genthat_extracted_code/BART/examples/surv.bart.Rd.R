library(BART)


### Name: surv.bart
### Title: Survival analysis with BART
### Aliases: surv.bart mc.surv.bart
### Keywords: nonparametric survival model nonproportional hazards

### ** Examples


## load survival package for the advanced lung cancer example
data(lung)

N <- length(lung$status)

table(lung$ph.karno, lung$pat.karno)

## if physician's KPS unavailable, then use the patient's
h <- which(is.na(lung$ph.karno))
lung$ph.karno[h] <- lung$pat.karno[h]

times <- lung$time
delta <- lung$status-1 ##lung$status: 1=censored, 2=dead
##delta: 0=censored, 1=dead

## this study reports time in days rather than weeks or months
## coarsening from days to weeks or months will reduce the computational burden
##times <- ceiling(times/30)
times <- ceiling(times/7)  ## weeks

table(times)
table(delta)

## matrix of observed covariates
x.train <- cbind(lung$sex, lung$age, lung$ph.karno)

## lung$sex:        Male=1 Female=2
## lung$age:        Age in years
## lung$ph.karno:   Karnofsky performance score (dead=0:normal=100:by=10)
##                  rated by physician

dimnames(x.train)[[2]] <- c('M(1):F(2)', 'age(39:82)', 'ph.karno(50:100:10)')

table(x.train[ , 1])
summary(x.train[ , 2])
table(x.train[ , 3])

##test BART with token run to ensure installation works
set.seed(99)
post <- surv.bart(x.train=x.train, times=times, delta=delta,
                  nskip=1, ndpost=1, keepevery=1)

## Not run: 
##D ## run one long MCMC chain in one process
##D ## set.seed(99)
##D ## post <- surv.bart(x.train=x.train, times=times, delta=delta, x.test=x.test)
##D 
##D ## in the interest of time, consider speeding it up by parallel processing
##D ## run "mc.cores" number of shorter MCMC chains in parallel processes
##D post <- mc.surv.bart(x.train=x.train, times=times, delta=delta,
##D                      mc.cores=8, seed=99)
##D 
##D pre <- surv.pre.bart(times=times, delta=delta, x.train=x.train,
##D                      x.test=x.train)
##D 
##D K <- pre$K
##D M <- nrow(post$yhat.train)
##D 
##D pre$tx.test <- rbind(pre$tx.test, pre$tx.test)
##D pre$tx.test[ , 2] <- c(rep(1, N*K), rep(2, N*K))
##D ## sex pushed to col 2, since time is always in col 1
##D 
##D pred <- predict(post, newdata=pre$tx.test, mc.cores=8)
##D 
##D pd <- matrix(nrow=M, ncol=2*K)
##D 
##D for(j in 1:K) {
##D     h <- seq(j, N*K, by=K)
##D     pd[ , j] <- apply(pred$surv.test[ , h], 1, mean)
##D     pd[ , j+K] <- apply(pred$surv.test[ , h+N*K], 1, mean)
##D }
##D 
##D pd.mu  <- apply(pd, 2, mean)
##D pd.025 <- apply(pd, 2, quantile, probs=0.025)
##D pd.975 <- apply(pd, 2, quantile, probs=0.975)
##D 
##D males <- 1:K
##D females <- males+K
##D 
##D plot(c(0, pre$times), c(1, pd.mu[males]), type='s', col='blue',
##D      ylim=0:1, ylab='S(t, x)', xlab='t (weeks)',
##D      main=paste('Advanced Lung Cancer ex. (BART::lung)',
##D                 "Friedman's partial dependence function",
##D                 'Male (blue) vs. Female (red)', sep='\n'))
##D lines(c(0, pre$times), c(1, pd.025[males]), col='blue', type='s', lty=2)
##D lines(c(0, pre$times), c(1, pd.975[males]), col='blue', type='s', lty=2)
##D lines(c(0, pre$times), c(1, pd.mu[females]), col='red', type='s')
##D lines(c(0, pre$times), c(1, pd.025[females]), col='red', type='s', lty=2)
##D lines(c(0, pre$times), c(1, pd.975[females]), col='red', type='s', lty=2)
##D 
##D 
## End(Not run)



