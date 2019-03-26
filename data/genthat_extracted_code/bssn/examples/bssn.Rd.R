library(bssn)


### Name: bssn
### Title: Birnbaum-Saunders model based on Skew-Normal distribution
### Aliases: bssn dbssn pbssn qbssn rbssn rmixbssn mmmeth
### Keywords: Birnbaum-Saunders Skew-Normal bssn

### ** Examples

## Not run: 
##D ## Let's plot an Birnbaum-Saunders model based on Skew-Normal distribution!
##D 
##D ## Density
##D  sseq <- seq(0,3,0.01)
##D  dens <- dbssn(sseq,alpha=0.2,beta=1,lambda=1.5)
##D  plot(sseq, dens,type="l", lwd=2,col="red", xlab="x", ylab="f(x)", main="BSSN Density function")
##D 
##D # Differing densities on a graph
##D # positive values of lambda
##D  y   <- seq(0,3,0.01)
##D  f1  <- dbssn(y,0.2,1,1)
##D  f2  <- dbssn(y,0.2,1,2)
##D  f3  <- dbssn(y,0.2,1,3)
##D  f4  <- dbssn(y,0.2,1,4)
##D  den <- cbind(f1,f2,f3,f4)
##D 
##D  matplot(y,den,type="l", col=c("deepskyblue4", "firebrick1", "darkmagenta", "aquamarine4"), ylab
##D  ="Density function",xlab="y",lwd=2,sub="(a)")
##D 
##D  legend(1.5,2.8,c("BSSN(0.2,1,1)", "BSSN(0.2,1,2)", "BSSN(0.2,1,3)","BSSN(0.2,1,4)"),
##D  col = c("deepskyblue4", "firebrick1", "darkmagenta", "aquamarine4"), lty=1:4,lwd=2,
##D  seg.len=2,cex=0.8,box.lty=0,bg=NULL)
##D 
##D 
##D #negative values of lambda
##D  y   <- seq(0,3,0.01)
##D  f1  <- dbssn(y,0.2,1,-1)
##D  f2  <- dbssn(y,0.2,1,-2)
##D  f3  <- dbssn(y,0.2,1,-3)
##D  f4  <- dbssn(y,0.2,1,-4)
##D  den <- cbind(f1,f2,f3,f4)
##D 
##D  matplot(y,den,type="l", col=c("deepskyblue4", "firebrick1", "darkmagenta", "aquamarine4"),
##D  ylab ="Density function",xlab="y",lwd=2,sub="(a)")
##D  legend(1.5,2.8,c("BSSN(0.2,1,-1)", "BSSN(0.2,1,-2)","BSSN(0.2,1,-3)", "BSSN(0.2,1,-4)"),
##D  col=c("deepskyblue4","firebrick1", "darkmagenta","aquamarine4"),lty=1:4,lwd=2,seg.len=2,
##D  cex=1,box.lty=0,bg=NULL)
##D 
##D 
##D ## Distribution Function
##D  sseq <- seq(0.1,6,0.05)
##D  df   <- pbssn(q=sseq,alpha=0.75,beta=1,lambda=3)
##D  plot(sseq, df, type = "l", lwd=2, col="blue", xlab="x", ylab="F(x)",
##D  main = "BSSN Distribution  function")
##D  abline(h=1,lty=2)
##D 
##D 
##D #Inverse Distribution Function
##D  prob <- seq(0,1,length.out = 1000)
##D  idf  <- qbssn(p=prob,alpha=0.75,beta=1,lambda=3)
##D  plot(prob, idf, type="l", lwd=2, col="gray30", xlab="x", ylab =
##D  expression(F^{-1}~(x)), mgp=c(2.3,1,.8))
##D  title(main="BSSN Inverse Distribution function")
##D  abline(v=c(0,1),lty=2)
##D 
##D 
##D #Random Sample Histogram
##D  sample <- rbssn(n=10000,alpha=0.75,beta=1,lambda=3)
##D  hist(sample,breaks = 70,freq = FALSE,main="")
##D  title(main="Histogram and True density")
##D  sseq   <- seq(0,8,0.01)
##D  dens   <- dbssn(sseq,alpha=0.75,beta=1,lambda=3)
##D  lines(sseq,dens,col="red",lwd=2)
##D 
##D 
##D ##Random Sample Histogram for Mixture of BSSN
##D alpha=c(0.55,0.25);beta=c(1,1.5);lambda=c(3,2);pii=c(0.3,0.7)
##D sample <- rmixbssn(n=1000,alpha,beta,lambda,pii)
##D hist(sample$y,breaks = 70,freq = FALSE,main="")
##D title(main="Histogram and True density")
##D temp   <- seq(min(sample$y), max(sample$y), length.out=1000)
##D lines(temp, (pii[1]*dbssn(temp, alpha[1], beta[1],lambda[1]))+(pii[2]*dbssn(temp, alpha[2]
##D , beta[2],lambda[2])), col="red", lty=3, lwd=3) # the theoretical density
##D lines(temp, pii[1]*dbssn(temp, alpha[1], beta[1],lambda[1]), col="blue", lty=2, lwd=3)
##D # the first component
##D lines(temp, pii[2]*dbssn(temp, alpha[2], beta[2],lambda[2]), col="green", lty=2, lwd=3)
##D # the second component
## End(Not run)



