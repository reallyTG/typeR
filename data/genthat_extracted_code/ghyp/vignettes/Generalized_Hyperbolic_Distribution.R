### R code from vignette source 'Generalized_Hyperbolic_Distribution.Rnw'
### Encoding: ISO8859-1

###################################################
### code chunk number 1: Generalized_Hyperbolic_Distribution.Rnw:685-686
###################################################
  library(ghyp)


###################################################
### code chunk number 2: Generalized_Hyperbolic_Distribution.Rnw:688-757
###################################################
  lambda <- -2:2
  a.bar <- 0.5 * 0:3 +0.01

  x.range <- 0.45
  y.range <- 0.4
  x.seq <- seq(-4, 4, length = 101)
  x.seq.range <- x.range / diff(range(x.seq)) * x.seq

  par(mfrow=c(2,2), omi=0.5*c(1.7,0.8,0.8,0),mai=c(0,0,0,0))

  plot(0,0,type="n",ylim=range(lambda)+c(-0.5,1),xlim=c(-0.3,max(a.bar)+0.5),
       xlab=expression(bar(alpha)),ylab=expression(lambda),xaxt="n")
  for(i in 1:length(a.bar)){
    for(j in 1:length(lambda)){
       gh.obj <- ghyp(alpha.bar=a.bar[i],lambda=lambda[j],gamma=0)
       gh.dens <- dghyp(x.seq,gh.obj)
       gh.dens <- y.range/diff(range(gh.dens))*gh.dens

       lines(x.seq.range+a.bar[i],gh.dens+lambda[j])
       points(a.bar[i],lambda[j])
    }
  }
  legend("topleft",legend=expression(paste("Symmetric: ",gamma," = 0")),bty="n",lty="blank")

  plot(0,0,type="n",ylim=range(lambda)+c(-0.5,1),xlim=c(-0.3,max(a.bar)+0.5),
       xlab=expression(bar(alpha)),yaxt="n",ylab="",xaxt="n")
  for(i in 1:length(a.bar)){
    for(j in 1:length(lambda)){
       gh.obj <- ghyp(alpha.bar=a.bar[i],lambda=lambda[j],gamma=-1)
       gh.dens <- dghyp(x.seq,gh.obj)
       gh.dens <- y.range/diff(range(gh.dens))*gh.dens

       lines(x.seq.range+a.bar[i],gh.dens+lambda[j])
       points(a.bar[i],lambda[j])
    }
  }
  legend("topleft",legend=expression(paste("Skewed: ",gamma," = -1")),bty="n",lty="blank")

  plot(0,0,type="n",ylim=range(lambda)+c(-0.5,1),xlim=c(-0.3,max(a.bar)+0.5),
       xlab=expression(bar(alpha)),ylab=expression(lambda))
  for(i in 1:length(a.bar)){
    for(j in 1:length(lambda)){
       gh.obj <- ghyp(alpha.bar=a.bar[i],lambda=lambda[j],gamma=0)
       gh.dens <- log(dghyp(x.seq,gh.obj))
       gh.dens <- y.range/diff(range(gh.dens))*gh.dens

       lines(x.seq.range+a.bar[i],gh.dens+lambda[j])
       points(a.bar[i],lambda[j])
    }
  }
  legend("topleft",legend=expression(paste("Symmetric: ",gamma," = 0")),bty="n",lty="blank")

  plot(0,0,type="n",ylim=range(lambda)+c(-0.5,1),xlim=c(-0.3,max(a.bar)+0.5),
       xlab=expression(bar(alpha)),yaxt="n",ylab="")
  for(i in 1:length(a.bar)){
    for(j in 1:length(lambda)){
       gh.obj <- ghyp(alpha.bar=a.bar[i],lambda=lambda[j],gamma=-1)
       gh.dens <- log(dghyp(x.seq,gh.obj))
       gh.dens <- y.range/diff(range(gh.dens))*gh.dens

       lines(x.seq.range+a.bar[i],gh.dens+lambda[j])
       points(a.bar[i],lambda[j])
    }
  }
  legend("topleft",legend=expression(paste("Skewed: ",gamma," = -1")),bty="n",lty="blank")

  title(main =  "Density and log-Density of the generalized hyperbolic distribution",
        sub=expression(paste("Y-Axis: ", lambda,"; X-Axis: ",bar(alpha),sep="")),
        outer = T,cex.sub=1.2)


###################################################
### code chunk number 3: Generalized_Hyperbolic_Distribution.Rnw:823-847
###################################################
  lambda <- seq(0.0, 8, length = 5)
  x <- seq(0, 20, length = 101)
  line.type = c("solid", "dotted", "dashed", "dotdash", "longdash")
  par(mfrow = c(1, 2))
  plot(x, besselK(x, lambda[1]), xlab = "x", ylab = expression(K[lambda]), type = "l", lty = line.type[1], log = "")
  for(i in 2:length(lambda)){
    lines(x, besselK(x, lambda[i]), lty = line.type[i])
  }
  legend("topright", legend = lambda, lty = line.type, lwd = 2, title = expression(paste(lambda, "=")))

  plot(x, besselK(x, lambda[1]), xlab = "x", ylab = expression(log(K[lambda])), type = "l", lty = line.type[1], log = "y")
  for(i in 2:length(lambda)){
    lines(x, besselK(x, lambda[i]), lty = line.type[i])
  }
  ##  x <- seq(0.1,1,length=30)
  ##  lambda <- rev(seq(0,2,length=30))
  ##  mod.bessel.3 <- outer(x,lambda)
  ##  for(i in 1:length(lambda)){
  ##    for(j in 1:length(x)){
  ##      mod.bessel.3[j,i] <- ghyp:::.besselM3(x=x[j],lambda=lambda[i])
  ##    }
  ##  }
  ##  persp(x=x,y=rev(lambda),z=mod.bessel.3,theta = 120,ylab="lambda",
  ##        phi = 10,ticktype="detailed")


###################################################
### code chunk number 4: Generalized_Hyperbolic_Distribution.Rnw:953-988
###################################################
  lambda <- -2:2 + 1e-5
  alpha.bar <- 0.5 * 0:3 + 0.01
  x.range <- 0.25
  y.range <- 0.4
  x.seq <- seq(0, 4, length = 101) + 1e-5
  x.seq.range <- x.range / diff(range(x.seq)) * x.seq
  par(mfrow = c(1, 2), omi = 0.5 * c(0, 0.0, 0.8, 0))

  par(mai=c(1,0.8,0,0))
  plot(0, 0, type = "n", ylim = range(lambda) + c(-0.5, 0.5), xlim = c(-0.1, max(alpha.bar) + 0.5),
       xlab = expression(bar(alpha)), ylab = expression(lambda))
  for(i in 1:length(alpha.bar)){
    for(j in 1:length(lambda)){
      tmp <- ghyp:::.abar2chipsi(lambda = lambda[j], alpha.bar = alpha.bar[i])
      gig.dens <- dgig(x.seq, lambda[i], tmp$chi, tmp$psi)
      gig.dens <- y.range/diff(range(gig.dens)) * gig.dens
      lines(x.seq.range + alpha.bar[i], gig.dens + lambda[j])
      points(alpha.bar[i], lambda[j])
    }
  }

  par(mai = c(1, 0, 0, 0.8))
  plot(0, 0, type = "n", ylim = range(lambda) + c(-0.5, 0.5), xlim = c(-0.1, max(alpha.bar) + 0.5),
       xlab = expression(bar(alpha)), yaxt = "n", ylab = "")
  for(i in 1:length(alpha.bar)){
    for(j in 1:length(lambda)){
      tmp <- ghyp:::.abar2chipsi(lambda = lambda[j], alpha.bar = alpha.bar[i])
      gig.dens <- log(dgig(x.seq,lambda[i],tmp$chi,tmp$psi))
      gig.dens <- y.range/diff(range(gig.dens[is.finite(gig.dens)]))*gig.dens
      lines(x.seq.range + alpha.bar[i], gig.dens + lambda[j])
      points(alpha.bar[i], lambda[j])
    }
  }
  title(main = "Density and log-density of the generalized inverse gaussian distribution",
        outer = TRUE, cex.main = 0.8)


###################################################
### code chunk number 5: Generalized_Hyperbolic_Distribution.Rnw:1287-1296
###################################################
  ## Load the package "ghyp" and the data "smi.stocks" first
  library(ghyp)
  ## Initialized a univariate GH distribution object with
  ## the lambda/alpha.bar parametrization
  ghyp(lambda=-2, alpha.bar=0.5, mu=10, sigma=5, gamma=1)
  ghyp.ad(lambda=-2, alpha=1, beta = 0.5, mu=10, delta=1)
  ## Initialized a multivariate GH distribution object with
  ## the lambda/chi/psi parametrization
  ghyp(lambda=-2, chi=5, psi=0.1, mu=10:11, sigma=diag(5:6), gamma=-1:0)


###################################################
### code chunk number 6: Generalized_Hyperbolic_Distribution.Rnw:1347-1351
###################################################
 data(smi.stocks)
 fitted.returns.mv <- fit.NIGmv(data=smi.stocks[1:500,c("CS","Nestle","Novartis")],
                                 silent=TRUE)
 pairs(fitted.returns.mv, cex=0.5, nbins=20)


###################################################
### code chunk number 7: Generalized_Hyperbolic_Distribution.Rnw:1358-1363
###################################################
  fitted.smi.returns <- fit.hypuv(data=smi.stocks[,c("SMI")],silent=TRUE)
  par(mfrow=c(1,3))
  hist(fitted.smi.returns,ghyp.col="blue",legend.cex=0.7)
  hist(fitted.smi.returns,log.hist=T,nclass=30,plot.legend=F,ghyp.col="blue")
  qqghyp(fitted.smi.returns,plot.legend=T,legend.cex=0.7)


