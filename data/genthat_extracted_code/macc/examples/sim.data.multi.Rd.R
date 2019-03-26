library(macc)


### Name: sim.data.multi
### Title: Generate two/three-level simulation data
### Aliases: sim.data.multi
### Keywords: datagen

### ** Examples

   ###################################################
    # Generate a two-level dataset

    # covariance matrix of errors
    delta<-0.5
    Sigma<-matrix(c(1,2*delta,2*delta,4),2,2)

    # model coefficients
    A0<-0.5
    B0<--1
    C0<-0.5

    Theta<-matrix(c(A0,0,C0,B0),2,2)

    # number of subjects, and trials of each
    set.seed(2000)
    N<-50
    K<-1
    n<-matrix(NA,N,K)
    for(i in 1:N)
    {
      n0<-rpois(1,100)
      n[i,]<-rpois(K,n0)
    }

    # treatment assignment list
    set.seed(100000)
    Z.list<-list()
    for(i in 1:N)
    {
      Z.list[[i]]<-rbinom(n[i,1],size=1,prob=0.5)
    }

    # Lambda
    rho.AB=rho.AC=rho.BC<-0
    Lambda<-matrix(0,3,3)
    lambda2.alpha=lambda2.beta=lambda2.gamma<-0.5
    Lambda[1,2]=Lambda[2,1]<-rho.AB*sqrt(lambda2.alpha*lambda2.beta)
    Lambda[1,3]=Lambda[3,1]<-rho.AC*sqrt(lambda2.alpha*lambda2.gamma)
    Lambda[2,3]=Lambda[3,2]<-rho.BC*sqrt(lambda2.beta*lambda2.gamma)
    diag(Lambda)<-c(lambda2.alpha,lambda2.beta,lambda2.gamma)

    # Data
    set.seed(5000)
    re.dat<-sim.data.multi(Z.list=Z.list,N=N,K=K,Theta=Theta,Sigma=Sigma,Lambda=Lambda)
    data2<-re.dat$data
    ###################################################

    ###################################################
    # Generate a three-level dataset

    # covariance matrix of errors
    delta<-0.5
    Sigma<-matrix(c(1,2*delta,2*delta,4),2,2)

    # model coefficients
    A0<-0.5
    B0<--1
    C0<-0.5

    Theta<-matrix(c(A0,0,C0,B0),2,2)

    # number of subjects, and trials of each
    set.seed(2000)
    N<-50
    K<-4
    n<-matrix(NA,N,K)
    for(i in 1:N)
    {
      n0<-rpois(1,100)
      n[i,]<-rpois(K,n0)
    }

    # treatment assignment list
    set.seed(100000)
    Z.list<-list()
    for(i in 1:N)
    {
      Z.list[[i]]<-list()
      for(j in 1:K)
      {
        Z.list[[i]][[j]]<-rbinom(n[i,j],size=1,prob=0.5)
      }
    }

    # Psi and Lambda
    sigma2.alpha=sigma2.beta=sigma2.gamma<-0.5
    theta2.alpha=theta2.beta=theta2.gamma<-0.5
    Psi<-diag(c(sigma2.alpha,sigma2.beta,sigma2.gamma))
    Lambda<-diag(c(theta2.alpha,theta2.beta,theta2.gamma))

    # Data
    set.seed(5000)
    re.dat<-sim.data.multi(Z.list,N,K,Theta,Sigma,Psi,Lambda)
    data3<-re.dat$data
    ###################################################



