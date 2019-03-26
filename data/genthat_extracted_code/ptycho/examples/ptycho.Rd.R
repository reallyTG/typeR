library(ptycho)


### Name: ptycho
### Title: Sample From Posterior Distributions
### Aliases: ptycho ptycho.all
### Keywords: models regression

### ** Examples

data(tinysim)
# Use replicate 4.
X <- tinysim$X; p <- ncol(X); nr <- 4
# COMBINE INFORMATION ACROSS RESPONSES
Y <- tinysim$replicates[[nr]]$y; q <- ncol(Y)
# Run 2 chains.
state <- list(list(indic.grp=rep(FALSE,p),
                   indic.var=matrix(FALSE,nrow=p,ncol=q), tau=1),
              list(indic.grp=rep(TRUE,p),
                   indic.var=matrix(TRUE,nrow=p,ncol=q), tau=1))
# In each chain, discard first 10 burn-in samples, then generate
# 100 samples and save running means after every 20 samples.
smpl.ph <- ptycho(X=X, y=Y, initStates=state, only.means=20*(1:5),
                  nburn=10)
# COMBINE INFORMATION ACROSS VARIANTS
# Use two groups of variants.
G <- 2; groups <- createGroupsSim(G, p)
# Run 2 chains.
state <- list(list(indic.grp=rep(FALSE,G),
                   indic.var=matrix(FALSE,nrow=p,ncol=1), tau=1),
              list(indic.grp=rep(TRUE,G),
                   indic.var=matrix(TRUE,nrow=p,ncol=1), tau=1))
# Use response 3.
y <- tinysim$replicates[[nr]]$y[,3,drop=FALSE]
smpl.var <- ptycho(X=X, y=y, groups=groups, initStates=state,
                   only.means=c(20*(1:5)), nburn=10, nthin=1)



