library(rlfsm)


### Name: path
### Title: Generator of linear fractional stable motion
### Aliases: path

### ** Examples

# Path generation

m<-256; M<-600; N<-2^10-M
alpha<-1.8; H<-0.8; sigma<-1
seed=2

List<-path(N=N,m=m,M=M,alpha=alpha,H=H,
           sigma=sigma,freq='L',disable_X=FALSE,seed=3)

# Normalized paths
Norm_lfsm<-List[['lfsm']]/max(abs(List[['lfsm']]))
Norm_oLm<-List[['levy_motion']]/max(abs(List[['levy_motion']]))

# Visualization of the paths
plot(Norm_lfsm, col=2, type="l", ylab="coordinate")
lines(Norm_oLm, col=3)
leg.txt <- c("lfsm", "oLm")
legend("topright",legend = leg.txt, col =c(2,3), pch=1)


# Creating Levy motion
levyIncrems<-path(N=N, m=m, M=M, alpha, H, sigma, freq='L',
                  disable_X=TRUE, levy_increments=NULL, seed=seed)

# Creating lfsm based on the levy motion
  lfsm_full<-path(m=m, M=M, alpha=alpha,
                  H=H, sigma=sigma, freq='L',
                  disable_X=FALSE,
                  levy_increments=levyIncrems$levy_increments,
                  seed=seed)

sum(levyIncrems$levy_increments==
    lfsm_full$levy_increments)==length(lfsm_full$levy_increments)







