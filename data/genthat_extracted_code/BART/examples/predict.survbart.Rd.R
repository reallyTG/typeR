library(BART)


### Name: predict.survbart
### Title: Predicting new observations with a previously fitted BART model
### Aliases: predict.survbart
### Keywords: nonparametric tree regression nonlinear

### ** Examples


## load the advanced lung cancer example
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

## this x.test is relatively small, but often you will want to
## predict for a large x.test matrix which may cause problems
## due to consumption of RAM so we can predict separately

## mcparallel/mccollect do not exist on windows
if(.Platform$OS.type=='unix') {
##test BART with token run to ensure installation works
    set.seed(99)
    post <- surv.bart(x.train=x.train, times=times, delta=delta, nskip=5, ndpost=5, keepevery=1)

    pre <- surv.pre.bart(x.train=x.train, times=times, delta=delta, x.test=x.test)

    pred <- predict(post, pre$tx.test)
    ##pred. <- surv.pwbart(pre$tx.test, post$treedraws, post$binaryOffset)
}

## Not run: 
##D ## run one long MCMC chain in one process
##D set.seed(99)
##D post <- surv.bart(x.train=x.train, times=times, delta=delta)
##D 
##D ## run "mc.cores" number of shorter MCMC chains in parallel processes
##D ## post <- mc.surv.bart(x.train=x.train, times=times, delta=delta,
##D ##                      mc.cores=5, seed=99)
##D 
##D pre <- surv.pre.bart(x.train=x.train, times=times, delta=delta, x.test=x.test)
##D 
##D pred <- predict(post, pre$tx.test)
##D 
##D ## let's look at some survival curves
##D ## first, a younger group with a healthier KPS
##D ## age 50 with KPS=90: males and females
##D ## males: row 17, females: row 23
##D x.test[c(17, 23), ]
##D 
##D low.risk.males <- 16*post$K+1:post$K ## K=unique times including censoring
##D low.risk.females <- 22*post$K+1:post$K
##D 
##D plot(post$times, pred$surv.test.mean[low.risk.males], type='s', col='blue',
##D      main='Age 50 with KPS=90', xlab='t', ylab='S(t)', ylim=c(0, 1))
##D points(post$times, pred$surv.test.mean[low.risk.females], type='s', col='red')
##D 
## End(Not run)



