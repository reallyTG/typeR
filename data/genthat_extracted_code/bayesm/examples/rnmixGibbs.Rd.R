library(bayesm)


### Name: rnmixGibbs
### Title: Gibbs Sampler for Normal Mixtures
### Aliases: rnmixGibbs
### Keywords: multivariate

### ** Examples

if(nchar(Sys.getenv("LONG_TEST")) != 0) {R=2000} else {R=10}
set.seed(66)

dim = 5
k = 3   # dimension of simulated data and number of "true" components
sigma = matrix(rep(0.5,dim^2), nrow=dim)
diag(sigma) = 1
sigfac = c(1,1,1)
mufac = c(1,2,3)
compsmv = list()
for(i in 1:k) compsmv[[i]] = list(mu=mufac[i]*1:dim, sigma=sigfac[i]*sigma)

# change to "rooti" scale
comps = list() 
for(i in 1:k) comps[[i]] = list(mu=compsmv[[i]][[1]], rooti=solve(chol(compsmv[[i]][[2]])))
pvec = (1:k) / sum(1:k)

nobs = 500
dm = rmixture(nobs, pvec, comps)

Data1 = list(y=dm$x)
ncomp = 9
Prior1 = list(ncomp=ncomp)
Mcmc1 = list(R=R, keep=1)

out = rnmixGibbs(Data=Data1, Prior=Prior1, Mcmc=Mcmc1)

cat("Summary of Normal Mixture Distribution", fill=TRUE)
summary(out$nmix)

tmom = momMix(matrix(pvec,nrow=1), list(comps))
mat = rbind(tmom$mu, tmom$sd)
cat(" True Mean/Std Dev", fill=TRUE)
print(mat)

## plotting examples
if(0){plot(out$nmix,Data=dm$x)}



