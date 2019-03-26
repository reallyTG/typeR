library(phmm)


### Name: traceHat
### Title: Trace of the "hat" matrix from PHMM-MCEM fit
### Aliases: traceHat
### Keywords: survival

### ** Examples


## Not run: 
##D n <- 50      # total sample size
##D nclust <- 5  # number of clusters
##D clusters <- rep(1:nclust,each=n/nclust)
##D beta0 <- c(1,2)
##D set.seed(13)
##D #generate phmm data set
##D Z <- cbind(Z1=sample(0:1,n,replace=TRUE),
##D            Z2=sample(0:1,n,replace=TRUE),
##D            Z3=sample(0:1,n,replace=TRUE))
##D b <- cbind(rep(rnorm(nclust),each=n/nclust),rep(rnorm(nclust),each=n/nclust))
##D Wb <- matrix(0,n,2)
##D for( j in 1:2) Wb[,j] <- Z[,j]*b[,j]
##D Wb <- apply(Wb,1,sum)
##D T <- -log(runif(n,0,1))*exp(-Z[,c('Z1','Z2')]%*%beta0-Wb)
##D C <- runif(n,0,1)
##D time <- ifelse(T<C,T,C)
##D event <- ifelse(T<=C,1,0)
##D mean(event)
##D phmmd <- data.frame(Z)
##D phmmd$cluster <- clusters
##D phmmd$time <- time
##D phmmd$event <- event
##D 
##D fit.phmm <- phmm(Surv(time, event) ~ Z1 + Z2 + (-1 + Z1 + Z2 | cluster),
##D    phmmd, Gbs = 100, Gbsvar = 1000, VARSTART = 1,
##D    NINIT = 10, MAXSTEP = 100, CONVERG=90)
##D 
##D # Same data can be fit with glmer,
##D # though the correlation structures are different.
##D poisphmmd <- pseudoPoisPHMM(fit.phmm)
##D 
##D library(lme4)
##D fit.lmer <- glmer(m~-1+as.factor(time)+z1+z2+
##D   (-1+w1+w2|cluster)+offset(log(N)),
##D   as.data.frame(as(poisphmmd, "matrix")), family=poisson, nAGQ=0)
##D 
##D fixef(fit.lmer)[c("z1","z2")]
##D fit.phmm$coef
##D 
##D VarCorr(fit.lmer)$cluster
##D fit.phmm$Sigma
##D 
##D logLik(fit.lmer)
##D fit.phmm$loglik
##D 
##D traceHat(fit.phmm)
## End(Not run)




