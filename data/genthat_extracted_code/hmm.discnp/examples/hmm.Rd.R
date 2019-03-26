library(hmm.discnp)


### Name: hmm
### Title: Fit a hidden Markov model to discrete data.
### Aliases: hmm
### Keywords: models

### ** Examples

# TO DO: Create one or more bivariate examples.
#
# The value of itmax in the following examples is so much
# too small as to be risible.  This is just to speed up the
# R CMD check process.
# 1.
Yval <- LETTERS[1:10]
Tpm  <- matrix(c(0.75,0.25,0.25,0.75),ncol=2,byrow=TRUE)
Rho  <- cbind(c(rep(1,5),rep(0,5)),c(rep(0,5),rep(1,5)))/5
rownames(Rho) <- Yval
set.seed(42)
xxx  <- rhmm(ylengths=rep(1000,5),nsim=1,tpm=Tpm,Rho=Rho,yval=Yval,drop=TRUE)
fit1  <- hmm(xxx,par0=list(tpm=Tpm,Rho=Rho),newstyle=FALSE,itmax=10)
print(fit1$Rho)
newRho  <- cnvrtRho(Rho)
fit2  <- hmm(xxx,par0=list(tpm=Tpm,Rho=newRho),itmax=10)
print(round(cnvrtRho(fit2$Rho),6))
# Agrees with fit1$Rho to 5 decimal places; the difference
# is due to the fitting procedure used with the "new style"
# Rho, which calls upon multinom() from the nnet package.

# 2.
# See the help for rhmm() for how to generate y.num.
## Not run: 
##D    fit.num     <- hmm(y.num,K=2,verb=TRUE,itmax=10)
##D    fit.num.mix <- hmm(y.num,K=2,verb=TRUE,mixture=TRUE,itmax=10)
##D    print(fit.num[c("tpm","Rho")])
## End(Not run)
# Note that states 1 and 2 get swapped.

# 3.
xxx <- with(SydColDisc,split(y,f=list(locn,depth)))
fitSydCol <- hmm(xxx,K=2,itmax=10) # Two states: above and below the thermocline.

# 4.
fitLesCount <- hmm(lesionCount,K=2,itmax=10) # Two states: relapse and remission.



