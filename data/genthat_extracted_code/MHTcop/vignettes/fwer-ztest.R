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
Sigma_GaussianAR1<-function(rho,m) {
  exponents<-abs(outer(1:m,1:m,"-")) #exponents for AR(1) matrix
  Sigma<-rho^exponents               #computes the AR(1) matrix
  return(Sigma)
}
n <- 100
m <- 10
m0 <- 5
mu <- c(rep(0,m0),runif(m-m0))
sample <- mvtnorm::rmvnorm(n,mu,Sigma_GaussianAR1(0.1,m))
res <- fwer.ztest(sample,rep(0,m))
res$test$Empirical

## ---- eval=FALSE---------------------------------------------------------
#  sig <- Sigma_GaussianAR1(rho,m)
#  samplefun <- function(mu) mvtnorm::rmvnorm(n,mu,sig)

## ---- eval=FALSE---------------------------------------------------------
#  testfun <- function(X) fwer.ztest(X,rep(0,m))

## ----eval = FALSE--------------------------------------------------------
#  v <- vignette('fwer-ztest',package = 'MHTcop')
#  file.edit(paste(v$Dir,'doc',v$R,sep='/'))

## ---- echo=FALSE, fig.height=6, fig.width=6------------------------------
empiricalPerformance <- function(testfun,samplefun,m,m0) {
  mu <- c(rep(0,m0),runif(m-m0))
  X <- samplefun(mu)
  t <- testfun(X)
  m1 <- m-m0
  empPower <- c()
  if(m1 > 0) empPower <- sapply(t$test,function(t) sum(t[(m0+1):m])/m1)
  c(sapply(t$test,function(t) sum(t[1:m0])),empPower)
}

doPlot <- function(title,params,BB,SS,GG) {
  ue<-max(c(BB,SS,GG))*1.1
  le<-min(c(BB,SS,GG))*0.99

  plot(params,BB,main=title,ylim=c(le,ue),ylab="",xlab=expression(rho),col="green")
  points(params,SS,pch=2,col="blue")
  points(params,GG,pch=3,col="red")
  legend('topleft', legend=c("Bonferroni", "Sidak","Adaptive"),
         col=c("green", "blue", "red"), pch=1:3,lty=NULL)
}

rows <- c("Bonferroni_FWER","Sidak_FWER","Emp_FWER","Bonferroni_Power","Sidak_Power","Emp_Power")

# --------------------------- Figure 2
rhos <- seq(0,0.9,0.1)
K <- 2500
m <- 10
m0 <- 5
n <- 100

data <- matrix(0,6,length(rhos))
rownames(data) <- rows

if(!file.exists('./sim_data/fwer_figure2.rds')) {
  cat("Performing Simulations for Figure 2\n")
  for(i in 1:length(rhos)) {
    cat("\t for rho =",rhos[i],"\n")
    sig <- Sigma_GaussianAR1(rhos[i],m)
    samplefun <- function(mu) mvtnorm::rmvnorm(n,mu,sig)
    testfun <- function(X) fwer.ztest(X,rep(0,m))
  
    cl <- makeCluster(detectCores(logical=FALSE))
    parallel::clusterSetRNGStream(cl, iseed = 0L)
    parallel::clusterEvalQ(cl,library(MHTcop))
    parallel::clusterExport(cl,c('empiricalPerformance','testfun','samplefun','m','m0','sig','n'))
  
    res <- pbapply::pbreplicate(K,empiricalPerformance(testfun,samplefun,m,m0),cl=cl)
  
    stopCluster(cl)
  
    data[,i] <- rowMeans(res)
  }
  saveRDS(data,'./sim_data/fwer_figure2.rds')
} else {
  data <- readRDS('./sim_data/fwer_figure2.rds')
}

doPlot("Empirical FWER",rhos,data["Bonferroni_FWER",],
       data["Sidak_FWER",],data["Emp_FWER",])

doPlot("Empirical Power",rhos,data["Bonferroni_Power",],
       data["Sidak_Power",],data["Emp_Power",])

## ---- echo=FALSE, fig.height=6, fig.width=6------------------------------
# --------------------------- Figure 3
rhos <- c(0.2, 0.5, 0.8)
K <- 2500
m <- 8
m0 <- 8
n <- 100
n.sims <- 300#200

data <- array(0,c(3,length(rhos),n.sims),list(rows[1:3],NULL,NULL))

if(!file.exists('./sim_data/fwer_figure3.rds')){
  cat("Performing Simulations for Figure 3\n")
  for(i in 1:length(rhos)) {
    cl <- makeCluster(detectCores(logical=FALSE))
    parallel::clusterSetRNGStream(cl, iseed = 0L)
    parallel::clusterEvalQ(cl,library(MHTcop))
    for(j in 1:n.sims) {
      cat("\t for rho =",rhos[i],"rep",j,"\n")
      sig <- Sigma_GaussianAR1(rhos[i],m)
      samplefun <- function(mu) mvtnorm::rmvnorm(n,mu,sig)
      testfun <- function(X) fwer.ztest(X,rep(0,m))
  
      parallel::clusterExport(cl,c('empiricalPerformance','testfun','samplefun','m','m0','sig','n'))
  
      res <- pbapply::pbreplicate(K,empiricalPerformance(testfun,samplefun,m,m0),cl=cl)
  
      data[,i,j] <- rowMeans(res)
    }
    stopCluster(cl)
  }
  saveRDS(data,'./sim_data/fwer_figure3.rds')
} else {
  data <- readRDS('./sim_data/fwer_figure3.rds')
}

for(i in 1:3) {
  hist(data["Emp_FWER",i,],xlab=paste("rho =",rhos[i]),main="Empirical Distribution of FWER");
}

## ---- eval=TRUE----------------------------------------------------------
Sigma_T_AR1<-function(m=2,rho=0,nu=3) {
  exponents<-abs(outer(1:m,1:m,"-"))  #exponents for AR(1) matrix
  Sigma<-(nu-2)/nu*rho^exponents      #computes the AR(1) matrix
  return(Sigma)
}
samplefun <- function(mu) {
  return(t(mu+t(mvtnorm::rmvt(n,sigma=sig,df=nu))))
}

## ---- eval=FALSE---------------------------------------------------------
#  sig <- Sigma_T_AR1(m,rho,nu)
#  testfun <- function(X) fwer.ztest(X,rep(0,m))

## ---- echo=FALSE, fig.height=6, fig.width=6------------------------------
# --------------------------- Figure 4
rhos <- seq(0,0.9,0.1)
K <- 2500
m <- 10
m0 <- 5
n <- 100

data <- matrix(0,6,length(rhos))
rownames(data) <- rows

if(!file.exists('./sim_data/fwer_figure4.rds')) {
  cat("Performing Simulations for Figure 4\n")
  for(i in 1:length(rhos)) {
    cat("\t for rho =",rhos[i],"\n")
  
    rho <- rhos[i]
    nu <- 9
    sig<-Sigma_T_AR1(m,rho,nu)
  
    samplefun <- function(mu) {
      return(t(mu+t(mvtnorm::rmvt(n,sigma=sig,df=nu))))
    }
    testfun <- function(X) fwer.ztest(X,rep(0,m))
  
    cl <- makeCluster(detectCores(logical=FALSE))
    parallel::clusterSetRNGStream(cl, iseed = 0L)
    parallel::clusterEvalQ(cl,library(MHTcop))
    parallel::clusterExport(cl,c('empiricalPerformance','testfun','samplefun','m','m0','sig','nu','n'))
  
    res <- pbapply::pbreplicate(K,empiricalPerformance(testfun,samplefun,m,m0),cl=cl)
  
    stopCluster(cl)
  
    data[,i] <- rowMeans(res)
  }
  saveRDS(data,'./sim_data/fwer_figure4.rds')
} else {
  data <- readRDS('./sim_data/fwer_figure4.rds')
}

doPlot("Empirical FWER",rhos,data["Bonferroni_FWER",],
       data["Sidak_FWER",],data["Emp_FWER",])

doPlot("Empirical Power",rhos,data["Bonferroni_Power",],
       data["Sidak_Power",],data["Emp_Power",])

## ---- echo=FALSE, fig.height=6, fig.width=6------------------------------
# --------------------------- Figure 5
rhos <- c(0.2, 0.5, 0.8)
K <- 2500
m <- 8
m0 <- 8
n <- 100
n.sims <- 300 #200

data <- array(0,c(3,length(rhos),n.sims),list(rows[1:3],NULL,NULL))

if(!file.exists('./sim_data/fwer_figure5.rds')) {
  cat("Performing Simulations for Figure 5\n")
  for(i in 1:length(rhos)) {
    cl <- makeCluster(detectCores(logical=FALSE))
    parallel::clusterSetRNGStream(cl, iseed = 0L)
    parallel::clusterEvalQ(cl,library(MHTcop))
  
    nu <- 9
    rho <- rhos[i]
    sig <- Sigma_T_AR1(m,rho,nu)
  
    for(j in 1:n.sims) {
      cat("\t for rho =",rhos[i],"rep",j,"\n")
      samplefun <- function(mu) {
        return(t(mu+t(mvtnorm::rmvt(n,sigma=sig,df=nu))))
      }
      testfun <- function(X) fwer.ztest(X,rep(0,m))
  
      parallel::clusterExport(cl,c('empiricalPerformance','testfun','samplefun','m','m0','sig','nu','n'))
  
      res <- pbapply::pbreplicate(K,empiricalPerformance(testfun,samplefun,m,m0),cl=cl)
  
      data[,i,j] <- rowMeans(res)
      #saveRDS(data,'./sim_data/fwer_figure5.rds')
    }
    stopCluster(cl)
  }
} else {
  data <- readRDS('./sim_data/fwer_figure5.rds')
}

for(i in 1:3) {
  hist(data["Emp_FWER",i,],xlab=paste("rho =",rhos[i]),main="Empirical Distribution of FWER");
}

