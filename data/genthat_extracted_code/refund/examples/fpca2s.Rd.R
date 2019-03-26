library(refund)


### Name: fpca2s
### Title: Functional principal component analysis by a two-stage method
### Aliases: fpca2s

### ** Examples


  #### settings
  I <- 50 # number of subjects
  J <- 3000 # dimension of the data
  t <- (1:J)/J # a regular grid on [0,1]
  N <- 4 #number of eigenfunctions
  sigma <- 2 ##standard deviation of random noises
  lambdaTrue <- c(1,0.5,0.5^2,0.5^3) # True eigenvalues

  case = 1
  ### True Eigenfunctions

  if(case==1) phi <- sqrt(2)*cbind(sin(2*pi*t),cos(2*pi*t),
                                   sin(4*pi*t),cos(4*pi*t))
  if(case==2) phi <- cbind(rep(1,J),sqrt(3)*(2*t-1),
                           sqrt(5)*(6*t^2-6*t+1),
                           sqrt(7)*(20*t^3-30*t^2+12*t-1))

  ###################################################
  ########     Generate Data            #############
  ###################################################
  xi <- matrix(rnorm(I*N),I,N);
  xi <- xi%*%diag(sqrt(lambdaTrue))
  X <- xi%*%t(phi); # of size I by J
  Y <- X + sigma*matrix(rnorm(I*J),I,J)

  results <- fpca2s(Y,npc=4,argvals=t)
  ###################################################
  ####               SVDS               ########
  ###################################################
  Phi <- results$efunctions
  eigenvalues <- results$evalues

  for(k in 1:N){
    if(Phi[,k]%*%phi[,k]< 0)
      Phi[,k] <- - Phi[,k]
  }

 ### plot eigenfunctions
 par(mfrow=c(N/2,2))
 seq <- (1:(J/10))*10
 for(k in 1:N){
      plot(t[seq],Phi[seq,k]*sqrt(J),type='l',lwd = 3,
           ylim = c(-2,2),col = 'red',
           ylab = paste('Eigenfunction ',k,sep=''),
           xlab='t',main='SVDS')

      lines(t[seq],phi[seq,k],lwd = 2, col = 'black')
      }



