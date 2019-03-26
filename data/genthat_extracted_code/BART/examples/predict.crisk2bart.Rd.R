library(BART)


### Name: predict.crisk2bart
### Title: Predicting new observations with a previously fitted BART model
### Aliases: predict.crisk2bart
### Keywords: nonparametric tree regression nonlinear

### ** Examples


data(transplant)

delta <- (as.numeric(transplant$event)-1)
## recode so that delta=1 is cause of interest; delta=2 otherwise
delta[delta==1] <- 4
delta[delta==2] <- 1
delta[delta>1] <- 2
table(delta, transplant$event)

times <- pmax(1, ceiling(transplant$futime/7)) ## weeks
##times <- pmax(1, ceiling(transplant$futime/30.5)) ## months
table(times)

typeO <- 1*(transplant$abo=='O')
typeA <- 1*(transplant$abo=='A')
typeB <- 1*(transplant$abo=='B')
typeAB <- 1*(transplant$abo=='AB')
table(typeA, typeO)

x.train <- cbind(typeO, typeA, typeB, typeAB)

x.test <- cbind(1, 0, 0, 0)
dimnames(x.test)[[2]] <- dimnames(x.train)[[2]]

## parallel::mcparallel/mccollect do not exist on windows
if(.Platform$OS.type=='unix') {
##test BART with token run to ensure installation works
        post <- mc.crisk2.bart(x.train=x.train, times=times, delta=delta,
                               seed=99, mc.cores=2, nskip=5, ndpost=5,
                               keepevery=1)

        pre <- surv.pre.bart(x.train=x.train, x.test=x.test,
                             times=times, delta=delta)

        K <- post$K

        pred <- mc.crisk2.pwbart(pre$tx.test, pre$tx.test,
                                post$treedraws, post$treedraws2,
                                post$binaryOffset, post$binaryOffset2)
}

## Not run: 
##D 
##D ## run one long MCMC chain in one process
##D ## set.seed(99)
##D ## post <- crisk2.bart(x.train=x.train, times=times, delta=delta, x.test=x.test)
##D 
##D ## in the interest of time, consider speeding it up by parallel processing
##D ## run "mc.cores" number of shorter MCMC chains in parallel processes
##D post <- mc.crisk2.bart(x.train=x.train,
##D                        times=times, delta=delta,
##D                        x.test=x.test, seed=99, mc.cores=8)
##D 
##D ## check <- mc.crisk2.pwbart(post$tx.test, post$tx.test,
##D ##                           post$treedraws, post$treedraws2,
##D ##                           post$binaryOffset,
##D ##                           post$binaryOffset2, mc.cores=8)
##D check <- predict(post, newdata=post$tx.test, newdata2=post$tx.test2,
##D                  mc.cores=8)
##D 
##D print(c(post$surv.test.mean[1], check$surv.test.mean[1],
##D         post$surv.test.mean[1]-check$surv.test.mean[1]), digits=22)
##D 
##D print(all(round(post$surv.test.mean, digits=9)==
##D     round(check$surv.test.mean, digits=9)))
##D 
##D print(c(post$cif.test.mean[1], check$cif.test.mean[1],
##D         post$cif.test.mean[1]-check$cif.test.mean[1]), digits=22)
##D 
##D print(all(round(post$cif.test.mean, digits=9)==
##D     round(check$cif.test.mean, digits=9)))
##D 
##D print(c(post$cif.test2.mean[1], check$cif.test2.mean[1],
##D         post$cif.test2.mean[1]-check$cif.test2.mean[1]), digits=22)
##D 
##D print(all(round(post$cif.test2.mean, digits=9)==
##D     round(check$cif.test2.mean, digits=9)))
##D 
## End(Not run)



