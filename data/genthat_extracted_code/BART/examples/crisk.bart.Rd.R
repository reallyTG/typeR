library(BART)


### Name: crisk.bart
### Title: BART for competing risks
### Aliases: crisk.bart mc.crisk.bart
### Keywords: nonparametric survival model nonproportional hazards

### ** Examples


data(transplant)

pfit <- survfit(Surv(futime, event) ~ abo, transplant)

# competing risks for type O
plot(pfit[4,], xscale=7, xmax=735, col=1:3, lwd=2, ylim=c(0, 1),
       xlab='t (weeks)', ylab='Aalen-Johansen (AJ) CI(t)')
    legend(450, .4, c("Death", "Transplant", "Withdrawal"), col=1:3, lwd=2)
## plot(pfit[4,], xscale=30.5, xmax=735, col=1:3, lwd=2, ylim=c(0, 1),
##        xlab='t (months)', ylab='Aalen-Johansen (AJ) CI(t)')
##     legend(450, .4, c("Death", "Transplant", "Withdrawal"), col=1:3, lwd=2)

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

##test BART with token run to ensure installation works
set.seed(99)
post <- crisk.bart(x.train=x.train, times=times, delta=delta,
                   x.test=x.test, nskip=1, ndpost=1, keepevery=1)

## Not run: 
##D 
##D ## run one long MCMC chain in one process
##D ## set.seed(99)
##D ## post <- crisk.bart(x.train=x.train, times=times, delta=delta, x.test=x.test)
##D 
##D ## in the interest of time, consider speeding it up by parallel processing
##D ## run "mc.cores" number of shorter MCMC chains in parallel processes
##D post <- mc.crisk.bart(x.train=x.train, times=times, delta=delta,
##D                       x.test=x.test, seed=99, mc.cores=8)
##D 
##D K <- post$K
##D 
##D typeO.cif.mean <- apply(post$cif.test, 2, mean)
##D typeO.cif.025 <- apply(post$cif.test, 2, quantile, probs=0.025)
##D typeO.cif.975 <- apply(post$cif.test, 2, quantile, probs=0.975)
##D 
##D plot(pfit[4,], xscale=7, xmax=735, col=1:3, lwd=2, ylim=c(0, 0.8),
##D        xlab='t (weeks)', ylab='CI(t)')
##D points(c(0, post$times)*7, c(0, typeO.cif.mean), col=4, type='s', lwd=2)
##D points(c(0, post$times)*7, c(0, typeO.cif.025), col=4, type='s', lwd=2, lty=2)
##D points(c(0, post$times)*7, c(0, typeO.cif.975), col=4, type='s', lwd=2, lty=2)
##D      legend(450, .4, c("Transplant(BART)", "Transplant(AJ)",
##D                        "Death(AJ)", "Withdrawal(AJ)"),
##D             col=c(4, 2, 1, 3), lwd=2)
##D ##dev.copy2pdf(file='../vignettes/figures/liver-BART.pdf')
##D ## plot(pfit[4,], xscale=30.5, xmax=735, col=1:3, lwd=2, ylim=c(0, 0.8),
##D ##        xlab='t (months)', ylab='CI(t)')
##D ## points(c(0, post$times)*30.5, c(0, typeO.cif.mean), col=4, type='s', lwd=2)
##D ## points(c(0, post$times)*30.5, c(0, typeO.cif.025), col=4, type='s', lwd=2, lty=2)
##D ## points(c(0, post$times)*30.5, c(0, typeO.cif.975), col=4, type='s', lwd=2, lty=2)
##D ##      legend(450, .4, c("Transplant(BART)", "Transplant(AJ)",
##D ##                        "Death(AJ)", "Withdrawal(AJ)"),
##D ##             col=c(4, 2, 1, 3), lwd=2)
##D 
## End(Not run)



