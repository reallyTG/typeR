library(morpheus)


### Name: multiRun
### Title: multiRun
### Aliases: multiRun

### ** Examples

## No test: 
beta <- matrix(c(1,-2,3,1),ncol=2)

# Bootstrap + computeMu, morpheus VS flexmix ; assumes fargs first 3 elts X,Y,K
io <- generateSampleIO(n=1000, p=1/2, beta=beta, b=c(0,0), "logit")
mu <- normalize(beta)
res <- multiRun(list(X=io$X,Y=io$Y,optargs=list(K=2,jd_nvects=0)), list(
  # morpheus
  function(fargs) {
    library(morpheus)
    ind <- fargs$ind
    computeMu(fargs$X[ind,],fargs$Y[ind],fargs$optargs)
  },
  # flexmix
  function(fargs) {
    library(flexmix)
    ind <- fargs$ind
    K <- fargs$optargs$K
    dat = as.data.frame( cbind(fargs$Y[ind],fargs$X[ind,]) )
    out = refit( flexmix( cbind(V1, 1 - V1) ~ 0+., data=dat, k=K,
      model=FLXMRglm(family="binomial") ) )
    normalize( matrix(out@coef[1:(ncol(fargs$X)*K)], ncol=K) )
  } ),
  prepareArgs = function(fargs,index) {
    if (index == 1)
      fargs$ind <- 1:nrow(fargs$X)
    else
      fargs$ind <- sample(1:nrow(fargs$X),replace=TRUE)
    fargs
  }, N=10, ncores=3)
for (i in 1:2)
  res[[i]] <- alignMatrices(res[[i]], ref=mu, ls_mode="exact")

# Monte-Carlo + optimParams from X,Y, morpheus VS flexmix ; first args n,p,beta,b
res <- multiRun(list(n=1000,p=1/2,beta=beta,b=c(0,0),optargs=list(link="logit")),list(
  # morpheus
  function(fargs) {
    library(morpheus)
    K <- fargs$optargs$K
    mu <- computeMu(fargs$X, fargs$Y, fargs$optargs)
    V <- list( p=rep(1/K,K-1), beta=mu, b=c(0,0) )
    optimParams(V,fargs$optargs)$beta
  },
  # flexmix
  function(fargs) {
    library(flexmix)
    K <- fargs$optargs$K
    dat <- as.data.frame( cbind(fargs$Y,fargs$X) )
    out <- refit( flexmix( cbind(V1, 1 - V1) ~ 0+., data=dat, k=K,
      model=FLXMRglm(family="binomial") ) )
    sapply( seq_len(K), function(i) as.double( out@components[[1]][[i]][,1] ) )
  } ),
  prepareArgs = function(fargs,index) {
    library(morpheus)
    io = generateSampleIO(fargs$n, fargs$p, fargs$beta, fargs$b, fargs$optargs$link)
    fargs$X = io$X
    fargs$Y = io$Y
    fargs$optargs$K = ncol(fargs$beta)
    fargs$optargs$M = computeMoments(io$X,io$Y)
    fargs
  }, N=10, ncores=3)
for (i in 1:2)
  res[[i]] <- alignMatrices(res[[i]], ref=beta, ls_mode="exact")
## End(No test)



