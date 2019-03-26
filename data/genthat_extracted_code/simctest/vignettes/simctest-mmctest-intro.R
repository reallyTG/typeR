### R code from vignette source 'simctest-mmctest-intro.Rnw'

###################################################
### code chunk number 1: simctest-mmctest-intro.Rnw:7-8
###################################################
options(width=80)


###################################################
### code chunk number 2: simctest-mmctest-intro.Rnw:40-41
###################################################
library(simctest)


###################################################
### code chunk number 3: simctest-mmctest-intro.Rnw:45-46 (eval = FALSE)
###################################################
## vignette("simctest-mmctest-intro")


###################################################
### code chunk number 4: simctest-mmctest-intro.Rnw:110-112
###################################################
fun <- function(ind,n,data)
  sapply(1:length(ind), function(i) sum(runif(n[i])<=data[ind[i]]));


###################################################
### code chunk number 5: simctest-mmctest-intro.Rnw:124-125
###################################################
s <- mmctSampler(fun,num=500,data=c(rep(0,100),runif(400)));


###################################################
### code chunk number 6: simctest-mmctest-intro.Rnw:135-154
###################################################
# class mmctSampler1, inherited from mmctSamplerGeneric
setClass("mmctSampler1", contains="mmctSamplerGeneric",
  representation=representation(data="numeric"))

# get n[i] new samples for every index i in ind
setMethod("getSamples", signature(obj="mmctSampler1"),
  function(obj, ind, n) {
    sapply(1:length(ind),
    function(i) { return(sum(runif(n[i])<=
    obj@data[ind[i]])); });
  }
)

# get number of hypotheses
setMethod("getNumber", signature(obj="mmctSampler1"),
  function(obj) {
    return(length(obj@data));
  }
)


###################################################
### code chunk number 7: simctest-mmctest-intro.Rnw:158-159
###################################################
s <- new("mmctSampler1", data=c(rep(0,100),runif(400)));


###################################################
### code chunk number 8: simctest-mmctest-intro.Rnw:206-208
###################################################
s <- mmctSampler(fun,num=500,data=c(rep(0,100),runif(400)));
m <- mmctest(h=hBH);


###################################################
### code chunk number 9: simctest-mmctest-intro.Rnw:234-236
###################################################
m <- run(m, s, maxsteps=list(maxnum=1000000,undecided=20));
m


###################################################
### code chunk number 10: simctest-mmctest-intro.Rnw:247-248
###################################################
summary.mmctestres(m)


###################################################
### code chunk number 11: simctest-mmctest-intro.Rnw:255-257
###################################################
m <- cont(m, steps=list(undecided=10));
m


###################################################
### code chunk number 12: simctest-mmctest-intro.Rnw:277-281
###################################################
res <- testResult(m);
res$undecided
length(res$rejected)
length(res$nonrejected)


###################################################
### code chunk number 13: simctest-mmctest-intro.Rnw:295-298
###################################################
estimate <- pEstimate(m);
lastindex <- length(estimate);
estimate[lastindex]


###################################################
### code chunk number 14: simctest-mmctest-intro.Rnw:308-311
###################################################
l <- confidenceLimits(m);
l$lowerLimits[lastindex]
l$upperLimits[lastindex]


###################################################
### code chunk number 15: simctest-mmctest-intro.Rnw:360-362
###################################################
rej <- rejProb(m)>0.5;
rej[1]


###################################################
### code chunk number 16: simctest-mmctest-intro.Rnw:395-400
###################################################
n <- 8;
ngroups <- 20;
G <- matrix(rep(0,n*ngroups), nrow=ngroups);
for(j in 1:(ngroups/2)) G[j,] <- c(rnorm(n/2,mean=0,sd=0.55),rnorm(n/2,mean=1,sd=0.55));
for(j in (ngroups/2+1):ngroups) G[j,] <- rnorm(n,mean=0,sd=3);


###################################################
### code chunk number 17: simctest-mmctest-intro.Rnw:408-430
###################################################
# class ExSampler, inherited from mmctSamplerGeneric
setClass("ExSampler", contains="mmctSamplerGeneric",
  representation=representation(data="matrix"))

setMethod("getSamples", signature(obj="ExSampler"),
  function(obj, ind, n) {
    sapply(1:length(ind), function(i) {
      v <- obj@data[ind[i],];
      s <- matrix(rep(v,n[i]+1), byrow=T, ncol=length(v));
      for(j in 1:n[i]) s[j+1,] <- sample(v);
      means <- abs(rowMeans(s[,1:(length(v)/2)])-
	rowMeans(s[,(length(v)/2+1):length(v)]));
      return(sum(means>means[1]));
    });
  }
)

setMethod("getNumber", signature(obj="ExSampler"),
  function(obj) {
    return(length(obj@data[,1]));
  }
)


###################################################
### code chunk number 18: simctest-mmctest-intro.Rnw:439-440
###################################################
exsampler <- new("ExSampler", data=G);


###################################################
### code chunk number 19: simctest-mmctest-intro.Rnw:448-450
###################################################
m <- mmctest(h=hBH);
m <- run(m, exsampler, maxsteps=list(undecided=0));


###################################################
### code chunk number 20: simctest-mmctest-intro.Rnw:456-457
###################################################
testResult(m)$rejected


###################################################
### code chunk number 21: simctest-mmctest-intro.Rnw:461-462
###################################################
pEstimate(m)


###################################################
### code chunk number 22: simctest-mmctest-intro.Rnw:468-499
###################################################
quickperm <- function(a) {
  n <- length(a);
  m <- matrix(rep(0,n*gamma(n+1)),ncol=n);
  mi <- 1;
  m[mi,] <- a;
  p <- rep(0,n);
  i <- 1;
  while(i<n) {
    if(p[i+1]<i) {
      if(i%%2==1) { j <- p[i+1]; } else { j <- 0; }
      z <- a[j+1];
      a[j+1] <- a[i+1];
      a[i+1] <- z;
      p[i+1] <- p[i+1]+1;
      i <- 1;
      mi <- mi+1;
      m[mi,] <- a;
    }
    else {
      p[i+1] <- 0;
      i <- i+1;
    }
  }
  return(m);
}
pexact <- rep(0,ngroups);
for(i in 1:ngroups) {
  perm <- quickperm(G[i,]);
  means <- abs(rowMeans(perm[,1:(n/2)]) - rowMeans(perm[,(n/2+1):n]));
  pexact[i] <- sum(means>means[1])/length(means);
}


###################################################
### code chunk number 23: simctest-mmctest-intro.Rnw:503-504
###################################################
pexact


###################################################
### code chunk number 24: simctest-mmctest-intro.Rnw:509-510
###################################################
which(hBH(pexact, threshold=0.1))


