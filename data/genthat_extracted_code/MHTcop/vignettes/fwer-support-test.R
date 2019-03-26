## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(parallel)
library(pbapply)
library("MHTcop")

## ------------------------------------------------------------------------
set.seed(0)
sample_GumbelBeta<-function(m,n,eta,alpha,beta,theta)
{
  V<-stabledist::rstable(n,1/eta,1,(cos(pi/(2*eta)))^eta,as.numeric(eta==1),1) #vector of stable distributed numbers
  UU<-matrix(rexp(n*m),nrow=n,ncol=m)                         #returns matrix of exponentially distributed numbers m columns, n rows
  sample_gumbel<-exp(-(UU/V)^(1/eta))                         #each row is divided by the same number v, then "psi" is applied
  sample_gumbel_beta0<-stats::qbeta(sample_gumbel,alpha,beta) #transform to beta margins
  return( sample_gumbel_beta0%*%diag(theta)  )                #return columns multiplied by respective scale theta
}
n <- 100
alpha <- 3
beta <- 3
m <- 10
m0 <- 5
theta <- c(rep(2,m0),2+runif(m-m0,max=0.5))
sample <- sample_GumbelBeta(m,n,1,alpha,beta,theta)
res <- fwer.support_test(sample,rep(2,m),alpha,beta)
res$test$Empirical

## ---- eval=FALSE---------------------------------------------------------
#  samplefun <- function(theta) sample_GumbelBeta(m,n,eta,alpha,beta,theta)

## ---- eval=FALSE---------------------------------------------------------
#  testfun <- function(X) fwer.support_test(X,rep(2,m),alpha,beta)

## ----eval = FALSE--------------------------------------------------------
#  v <- vignette('fwer-support-test',package = 'MHTcop')
#  file.edit(paste(v$Dir,'doc',v$R,sep='/'))

## ---- echo=FALSE, fig.height=6, fig.width=6------------------------------
empiricalPerformance <- function(testfun,samplefun,m,m0) {
  theta <- c(rep(2,m0),2+runif(m-m0,max=0.5))
  X <- samplefun(theta)
  t <- testfun(X)
  m1 <- m-m0
  empPower <- c()
  if(m1 > 0) empPower <- sapply(t$test,function(t) sum(t[(m0+1):m])/m1)
  c(sapply(t$test,function(t) sum(t[1:m0])),empPower)
}

doPlot <- function(title,params,BB,SS,GG) {
  ue<-max(c(BB,SS,GG))*1.1
  le<-min(c(BB,SS,GG))*0.99

  plot(params,BB,main=title,ylim=c(le,ue),ylab="",xlab=expression(eta),col="green")
  points(params,SS,pch=2,col="blue")
  points(params,GG,pch=3,col="red")
  legend('topleft', legend=c("Bonferroni", "Sidak","Adaptive"),
         col=c("green", "blue", "red"), pch=1:3,lty=NULL)
}

rows <- c("Bonferroni_FWER","Sidak_FWER","Emp_FWER","Bonferroni_Power","Sidak_Power","Emp_Power")
# --------------------------- Figure 6
K <- 2500
n <- 100
alpha <- 3
beta <- 3
m <- 10
m0 <- 5
etas <- seq(1,4,0.3)

data <- matrix(0,6,length(etas))
rownames(data) <- rows

if(!file.exists('./sim_data/fwer_figure6.rds')) {
  cat("Performing Simulations for Figure 6\n")
  for(i in 1:length(etas)) {
    cat("\t for eta =",etas[i],"\n")
  
    eta <- etas[i]
    samplefun <- function(theta) sample_GumbelBeta(m,n,eta,alpha,beta,theta)
    testfun <- function(X) fwer.support_test(X,rep(2,m),alpha,beta)
  
    cl <- makeCluster(detectCores(logical=FALSE))
    parallel::clusterSetRNGStream(cl, iseed = 0L)
    parallel::clusterEvalQ(cl,library(MHTcop))
    parallel::clusterExport(cl,c('empiricalPerformance','testfun','samplefun','sample_GumbelBeta','m','m0','m','n','eta','alpha','beta'))
  
    res <- pbapply::pbreplicate(K,empiricalPerformance(testfun,samplefun,m,m0),cl=cl)
  
    stopCluster(cl)
  
    data[,i] <- rowMeans(res)
  }
  saveRDS(data,'./sim_data/fwer_figure6.rds')
} else {
  data <- readRDS('./sim_data/fwer_figure6.rds')
}

doPlot("Empirical FWER",etas,data["Bonferroni_FWER",],
       data["Sidak_FWER",],data["Emp_FWER",])

doPlot("Empirical Power",etas,data["Bonferroni_Power",],
       data["Sidak_Power",],data["Emp_Power",])

## ---- echo=FALSE, fig.height=6, fig.width=6------------------------------
# --------------------------- Figure 7
K <- 2500
n <- 400
n.sims <- 400
alpha <- 3
beta <- 3
m <- 8
m0 <- 8
etas <- c(1,3,5)

data <- array(0,c(3,length(etas),n.sims),list(rows[1:3],NULL,NULL))

if(!file.exists('./sim_data/fwer_figure7.rds')) {
  cat("Performing Simulations for Figure 7\n")
  for(i in 1:length(etas)) {
    cl <- makeCluster(detectCores(logical=FALSE))
    parallel::clusterSetRNGStream(cl, iseed = 0L)
    parallel::clusterEvalQ(cl,library(MHTcop))
    for(j in 1:n.sims) {
      cat("\t for eta =",etas[i],"rep",j,"\n")
      eta <- etas[i]
      samplefun <- function(theta) sample_GumbelBeta(m,n,eta,alpha,beta,theta)
      testfun <- function(X) fwer.support_test(X,rep(2,m),alpha,beta)
  
      parallel::clusterExport(cl,c('empiricalPerformance','testfun','samplefun','sample_GumbelBeta','m','m0','m','n','eta','alpha','beta'))
  
      res <- pbapply::pbreplicate(K,empiricalPerformance(testfun,samplefun,m,m0),cl=cl)
  
      data[,i,j] <- rowMeans(res)
    }
    stopCluster(cl)
  }
  saveRDS(data,'./sim_data/fwer_figure7.rds')
} else {
  data <- readRDS('./sim_data/fwer_figure7.rds')
}

for(i in 1:3) {
  hist(data["Emp_FWER",i,],xlab=paste("eta =",etas[i]),main="Empirical Distribution of FWER");
}

## ------------------------------------------------------------------------
# Sampling from the Archimedean copula defined by (18)
sample_arch_copula <- function(m,n,theta,eta,alpha,beta)
{
  FR <- function(x,d,eta) {
    g <- numeric(length=d)
    x_eta <- x^eta
    g[1] <- 1/(1+x_eta)
    i <- 0:(d-1)
    p_ <- cumprod((eta-i)/(i+1))
    for(k in 1:(d-1)) {
      g[k+1] <- -1 * x_eta * sum(g[1:k] * p_[k:1]) / (1+x_eta)
    }
    sgn <- rep_len(c(1,-1),d)
    sgn[d] <- sgn[d] * (g[d]>0)
    return(1 - sum(sgn*g))
  }

  RadialCDF <- function(t,eta,dim=4) {
    eta<-1/eta
    x<-tan(pi/2*t)
    return(FR(x,dim,eta))
  }
  psi<-function(t) 1/(t^(1/eta)+1)
  delta<-RadialCDF(1,eta,m)
  T<-runif(n,max=delta)
  #define help function for inversion sampling
  toinvert<-function(x,y) RadialCDF(x,eta,m)-y
  inverter<-function(x) uniroot(function(t) toinvert(t,x),interval=c(0,1),tol=.Machine$double.eps)$root
  W<-tan(pi/2*sapply(T,inverter))
  #draw sample uniformly on d-simplex
  S<-MCMCpack::rdirichlet(n,alpha=rep(1,m))
  #random vectors that follow copula with uniform margins
  copula_plain<-psi(S*W)   #n rows and m columns
  #transform to beta margins
  copula_withBeta<-qbeta(copula_plain,alpha,beta)
  #return columns multiplied by respective scale theta
  return(copula_withBeta%*%diag(theta))
}
samplefun <- function(theta) sample_arch_copula(m,n,theta,eta,alpha,beta)

## ---- eval=FALSE---------------------------------------------------------
#  testfun <- function(X) fwer.support_test(X,rep(2,m),alpha,beta,boot.reps=400)

## ---- echo=FALSE, fig.height=6, fig.width=6------------------------------
# --------------------------- Figure 8
K <- 2500
n <- 100
alpha <- 3
beta <- 3
m <- 8
m0 <- 4
etas <- seq(1,4,0.3)

data <- matrix(0,6,length(etas))
rownames(data) <- rows

if(!file.exists('./sim_data/fwer_figure8.rds')) {
  cat("Performing Simulations for Figure 8\n")
  for(i in 1:length(etas)) {
    cat("\t for eta =",etas[i],"\n")
  
    eta <- etas[i]
    samplefun <- function(theta) sample_arch_copula(m,n,theta,eta,alpha,beta)
    testfun <- function(X) fwer.support_test(X,rep(2,m),alpha,beta,400)
  
    cl <- makeCluster(detectCores(logical=FALSE))
    parallel::clusterSetRNGStream(cl, iseed = 0L)
    parallel::clusterEvalQ(cl,library(MHTcop))
    parallel::clusterExport(cl,c('empiricalPerformance','testfun','samplefun','sample_arch_copula','m','m0','m','n','eta','alpha','beta'))
  
    res <- pbapply::pbreplicate(K,empiricalPerformance(testfun,samplefun,m,m0),cl=cl)
  
    stopCluster(cl)
  
    data[,i] <- rowMeans(res)
  }
  saveRDS(data,'./sim_data/fwer_figure8.rds')
} else {
  data <- readRDS('./sim_data/fwer_figure8.rds')
}

doPlot("Empirical FWER",etas,data["Bonferroni_FWER",],
       data["Sidak_FWER",],data["Emp_FWER",])

doPlot("Empirical Power",etas,data["Bonferroni_Power",],
       data["Sidak_Power",],data["Emp_Power",])

## ---- echo=FALSE, fig.height=6, fig.width=6------------------------------
# --------------------------- Figure 9
K <- 2500
n <- 400
n.sims <- 400
alpha <- 3
beta <- 4
m <- 4
m0 <- 4
etas <- c(1.5,2,2.5)

data <- array(0,c(3,length(etas),n.sims),list(rows[1:3],NULL,NULL))

if(!file.exists('./sim_data/fwer_figure9.rds')) {
  cat("Performing Simulations for Figure 9\n")
  for(i in 1:length(etas)) {
    cl <- makeCluster(detectCores(logical=FALSE))
    parallel::clusterSetRNGStream(cl, iseed = 0L)
    parallel::clusterEvalQ(cl,library(MHTcop))
    for(j in 1:n.sims) {
      cat("\t for eta =",etas[i],"rep",j,"\n")
      eta <- etas[i]
      samplefun <- function(theta) sample_GumbelBeta(m,n,eta,alpha,beta,theta)
      testfun <- function(X) fwer.support_test(X,rep(2,m),alpha,beta,400)
  
      parallel::clusterExport(cl,c('empiricalPerformance','testfun','samplefun','sample_GumbelBeta','m','m0','m','n','eta','alpha','beta'))
  
      res <- pbapply::pbreplicate(K,empiricalPerformance(testfun,samplefun,m,m0),cl=cl)
  
      data[,i,j] <- rowMeans(res)
    }
    stopCluster(cl)
    saveRDS(data,'./sim_data/fwer_figure9.rds')
  }
} else {
  data <- readRDS('./sim_data/fwer_figure9.rds')
}

for(i in 1:3) {
  hist(data["Emp_FWER",i,],xlab=paste("eta =",etas[i]),main="Empirical Distribution of FWER");
}

