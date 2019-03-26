## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library("pbapply")
library("MHTcop")


## ------------------------------------------------------------------------
library(copula)
set.seed(1)
m <- 20
m0 <- 0.8*m
p_values <- rCopula(1,onacopulaL(copClayton,list(1,1:20)))
mu<-runif(m-m0, min=-1, max=-1/2)
p_values[1,(m0+1):m]<-pnorm(sqrt(m)*mu+qnorm(p_values[(m0+1):m]),0,1)

## ------------------------------------------------------------------------
ac_fdr.test(p_values,setTheta(copClayton,1),m0,0.05,1e4)$test

## ---- results='hide', include='false'------------------------------------
set.seed(0);
calc_F_zst <- function(m,theta,cop,z_star,fname) {
  fname <- paste('./sim_data', fname, sep="/") 
  cat("Calculating F_Z(z_star) for the",cop@name,"copula and m =",m,"\n")
  if(!file.exists(fname)) {
    res <- list(theta=theta,F_zst=pbsapply(theta,function(theta) {
        X <- cdf.Z(copula::setTheta(cop,theta),z_star(m,0.05,theta))
      }))
    saveRDS(res,fname)
    res
  } else {
    readRDS(fname)
  }
}

plot_F_zst <- function(data) {
  theta <- data$theta
  F_zst <- data$F_zst
  plot(theta,F_zst, main="",  xlab=(expression(eta)), ylab=(expression(F[Z](z~"*"))), axes=FALSE,frame=TRUE, type="n", lty=1, lwd = 2, col = "black")
  lines(theta,F_zst,lty=1, lwd = 2, col = "black")
  axis(side=1, at=seq(0, 20, 1), label=seq(0, 20, 1), lwd=1)
  axis(side=2, at=seq(0.0, 1.0, 0.1), label=seq(0.0, 1.0, 0.1), lwd=1)

  plot(theta[theta>=5],F_zst[theta>=5], main="",  xlab=(expression(eta)), ylab=(expression(F[Z](z~"*"))), axes=FALSE,frame=TRUE, type="n", lty=1, lwd = 2, col = "black")
  lines(theta[theta>=5],F_zst[theta>=5],lty=1, lwd = 2, col = "black")
  axis(side=1, at=seq(0, 20, 1), label=seq(0, 20, 1), lwd=1)
  e <- floor(log10(max(F_zst[theta>=5])))-1
  ticks <- do.call(seq,as.list(c(round(range(F_zst[theta>=5]),-e),10^e)))
  axis(side=2, at=ticks, label=ticks, lwd=1)
}

## ---- echo=4, eval=FALSE-------------------------------------------------
#  cop <- copula::copClayton
#  theta <- 2
#  z <- 1
#  cdf.Z(copula::setTheta(cop,theta),z)

## ------------------------------------------------------------------------
z_star_Clayton <- function(m,q,eta) {
  log(m) / ((m/q)^eta - (1/q)^eta)
}

## ------------------------------------------------------------------------
z_star_Gumbel <- function(m,q,eta) {
  log(m) / ((-log(q/m))^eta-(-log(q))^eta)
}

## ----eval = FALSE--------------------------------------------------------
#  v <- vignette('fdr-test',package = 'MHTcop')
#  file.edit(paste(v$Dir,'doc',v$R,sep='/'))

## ---- echo=FALSE, results='hide'-----------------------------------------
theta <- seq(10^(-20),20+10^(-20),0.1)
cat("Generating Figure 1 a)\n")
plot_F_zst(calc_F_zst(20,theta,copula::copClayton,z_star_Clayton,'fdr_figure1a.rds'));

## ---- echo=FALSE, results='hide'-----------------------------------------
cat("Generating Figure 1 b)\n")
plot_F_zst(calc_F_zst(200,theta,copula::copClayton,z_star_Clayton,'fdr_figure1b.rds'));

## ---- echo=FALSE, results='hide'-----------------------------------------
theta<- seq(1+10^(-15),20+10^(-15),0.1)

cat("Generating Figure 5 a)\n")
plot_F_zst(calc_F_zst(20,theta,copula::copGumbel,z_star_Gumbel,'fdr_figure5a.rds'));

## ---- echo=FALSE, results='hide'-----------------------------------------
cat("Generating Figure 5 b)\n")
plot_F_zst(calc_F_zst(200,theta,copula::copGumbel,z_star_Gumbel,'fdr_figure5b.rds'));

## ---- include=FALSE------------------------------------------------------
plotBounds <- function(boundsData,sim,figTitle) {
  bounds <- boundsData$lowerBound
  bounds[1] <- 0.8*min(boundsData$lowerBound)
  bounds[2] <- 1.2*boundsData$upperBound
  plot(theta,bounds, main="",  xlab=(expression(eta)), ylab="FDR", axes=FALSE,frame=TRUE, type="n", lty=1, lwd = 2, col = "black")
  title(main=paste("FDR, ",figTitle,"Copula"))
  lines(theta,rep.int(boundsData$upperBound,length(theta)),lty=2, lwd = 2, col = "red")
  lines(theta,boundsData$sharperUpperBound,lty=1, lwd = 2, col = "black")
  lines(theta,boundsData$lowerBound,lty=2, lwd = 2, col = "blue")
  lines(theta,sim$FDR, lwd = 2, col = "darkgreen")
  axis(side=1, at=seq(0, 20, 1), label=seq(0, 20, 1), lwd=1)
  axis(side=2, at=seq(0.0, 0.05, 0.01), label=seq(0.0, 0.05, 0.01), lwd=1)
  legend(10, 0.02, c("Upper Bound","Sharper Upper Bound","Lower Bound","Simulated Values"), lty=c(2,1,2,1), lwd = c(2,2,2,2), col = c("red","black","blue","darkgreen"), bg = "white")
}

plotPower <- function(sim,figTitle) {
  plot(c(theta,theta),c(sim$empiricalPowerImproved,sim$empiricalPower), main="",  xlab=(expression(eta)), ylab="Average Power", axes=FALSE,frame=TRUE, type="n", lty=1, lwd = 2, col = "black")
  title(main=paste("Average Power,",figTitle,"Copula"))
  lines(theta,sim$empiricalPowerImproved,lty=1, lwd = 2, col = "black")
  lines(theta,sim$empiricalPower,lty=1, lwd = 2, col = "red")
  axis(side=1, at=seq(0, 20, 1), label=seq(0, 20, 1), lwd=1)
  axis(side=2, at=seq(0.5, 1.0, 0.01), label=seq(0.5, 1.0, 0.01), lwd=1)
  legend("topright", c("improved LSU","traditional LSU"), lty=c(1,1), lwd = c(2,2), col = c("black","red"), bg = "white")
}

plotFDRsd <- function(boundsData,sim,figTitle) {
  FDR_ub_sd<-sqrt(abs(boundsData$sharperUpperBound.var))
  FDR_fig_b <- FDR_ub_sd
  FDR_fig_b[1] <- 0.95*min(FDR_ub_sd)
  FDR_fig_b[2] <- 1.02*max(sim$FDR.sd)

  plot(theta,FDR_fig_b, main="",  xlab=(expression(eta)), ylab="Standard Deviation", axes=FALSE,frame=TRUE, type="n", lty=1, lwd = 2, col = "black")
  title(main=paste("Standard Deviation,",figTitle,"Copula"))
  lines(theta,FDR_ub_sd,lty=1, lwd = 2, col = "black")
  lines(theta,sim$FDR.sd,lty=1, lwd = 2, col = "red")
  axis(side=1, at=seq(0, 20, 1), label=seq(0, 20, 1), lwd=1)
  axis(side=2, at=seq(0.0, 0.20, 0.02), label=seq(0.0, 0.20, 0.02), lwd=1)
  legend(10, 0.08, c("Sharper Upper Bound","Simulated Values"), lty=c(1,1), lwd = c(2,2), col = c("black","red"), bg = "white")
}

set.seed(0);
#Sample size for Monte-Carlo approximations
NZ <- 1e5

alpha <- 0.05

## ------------------------------------------------------------------------
calcBounds <- function(cop) {
  upperBound <- (m0/m)*alpha
  cat("Calculating upper bound for the",cop@name,"copula ( m =",m,")\n")
  delta <- pbsapply(theta,function(theta)
   ac_fdr.calc_delta(copula::setTheta(cop,theta),m,m0,
   alpha=alpha,num.reps=NZ,calc.var=TRUE))
  sharperUpperBound <- upperBound * delta[1,]
  sharperUpperBound.var <- upperBound^2 * delta[2,]
  delta <- delta[1,]
  lowerBound <- sapply(theta,function(theta){alpha*(m0/m)*
   (1+pgamma(log(m)/(m^(theta)-1),shape=1/(theta),scale=1)-
      pgamma((log(m)*(m^(theta)))/(m^(theta)-1),shape=1/(theta),scale=1))})
  list(upperBound=upperBound,sharperUpperBound=sharperUpperBound,
       sharperUpperBound.var=sharperUpperBound.var,
       delta=delta,lowerBound=lowerBound)
}

## ------------------------------------------------------------------------
simFDR <- function(cop,delta) {
  cat("Performing simulation for the",cop@name,"copula ( m =",m,")\n")
  Sim <- do.call(cbind,pblapply(seq_along(theta),function(l) {
    p_values<-matrix(0,3,m)
    q_k<-(alpha/m)*seq(1,m,1)
    p_values_data <- copula::rCopula(NZ,copula::onacopulaL(cop,list(theta[l],1:m)))
    data_f<-function(s)
    {
      p_values[1,]<-p_values_data[s,]
      p_values[2,1:m]<-0
      mu<-runif(m-m0, min=-1, max=-1/2)
      p_values[1,(m0+1):m]<-pnorm(sqrt(m)*mu+qnorm(p_values_data[s,(m0+1):m]),0,1)
      p_values[2,(m0+1):m]<-1
      sp_values<-matrix(0,3,m)
      sp_values<-p_values[,order(p_values[1,])]
      sp_values[3,]<-seq(1,m,1)

      #Calculations for the FDR
      R_m<-0
      V_m<-0
      if (sum(sp_values[1,]<q_k)>0)
      {
        R_m<-sum(max(sp_values[3,sp_values[1,]<q_k]))
        V_m<-R_m-sum(sp_values[2,1:R_m])
      }

      #Calculations for the power
      S_m<-0
      if (sum(sp_values[1,]<q_k)>0)
      {
        S_m<-sum(sp_values[2,1:sum(max(sp_values[3,sp_values[1,]<q_k]))])
      }

      #Calculations for the power of the improved procedure
      S_m.improved<-0
      if (sum(sp_values[1,]<q_k/delta[l])>0)
      {
        S_m.improved<-sum(sp_values[2,1:sum(max(sp_values[3,sp_values[1,]<q_k/delta[l]]))])
      }

      return(c(V_m/max(1,R_m),S_m/(m-m0),S_m.improved/(m-m0)))
    }
    data_in<-sapply(1:NZ,data_f)
    FDR.sd <- sd(data_in[1,])
    data_in<-rowMeans(data_in)
    data_in[4]<-FDR.sd
    return(data_in)
  }))
  list(FDR=Sim[1,],empiricalPower=Sim[2,],empiricalPowerImproved=Sim[3,],
       FDR.sd=Sim[4,])
}

## ---- echo=FALSE, fig.height=6, fig.width=6------------------------------
figure <-     c(c("2","3","4"),
                c("6","7","8"))
subFigure <-  c(c("a","a","a"),
                c("a","a","a"))
figTitle <-   c(rep("Clayton",3),
                rep("Gumbel-Hougaard",3))

thetaList <- list(seq(0.00001,20.00001,0.2),
                  seq(1.00001,20.00001,0.2))

i <- 0
j <- 0
for(cop in c(copula::copClayton,copula::copGumbel)) {
  j <- j + 1;
  theta <- thetaList[[j]]
  for(m in c(20)) {
    i <- i + 1;
    m0 <- 0.8*m
    fname = paste('./sim_data/fdr_figure',figure[i],subFigure[i],'.rds',sep='')
    if(!file.exists(fname)) {
      bounds <- calcBounds(cop);
      sim <- simFDR(cop,bounds$delta);
      res <- list(bounds=bounds,sim=sim)
      saveRDS(res,fname)
    } else {
      res <- readRDS(fname)
    }
    
    bounds <- res$bounds
    sim <- res$sim

    cat("Generating Figure",figure[i],subFigure[i],")\n")
    #pdf(file=paste0(paste("graphics/fdr_Figure",figure[i],subFigure[i],sep="_"),".pdf"), width=9, height=7);
    plotBounds(bounds,sim,figTitle[i])
    #ignore <- dev.off();

    i <- i + 1;
    cat("Generating Figure",figure[i],subFigure[i],")\n")
    #pdf(file=paste0(paste("graphics/fdr_Figure",figure[i],subFigure[i],sep="_"),".pdf"), width=9, height=7);
    plotPower(sim,figTitle[i])
    #ignore <- dev.off();

    i <- i + 1;
    cat("Generating Figure",figure[i],subFigure[i],")\n")
    #pdf(file=paste0(paste("graphics/fdr_Figure",figure[i],subFigure[i],sep="_"),".pdf"), width=9, height=7);
    plotFDRsd(bounds,sim,figTitle[i])
    #ignore <- dev.off();
  }
}

