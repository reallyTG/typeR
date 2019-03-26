## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", fig.width=5, fig.height=5
)

## ---- get parameters, message=F, warning=F-------------------------------
library(BDP2)
p0=0.12
p1=0.3
pF=0.3
pE=0.12
shape1F=0.3
shape2F=0.7
shape1E=0.12
shape2E=0.88
cF=0.01
cE=0.9

## ---- Figure 1, fig.show='hold',fig.width=6, fig.height=4----------------
##plot PF
  plot(function(x) x,0,0.8,add=F,type="n",col="black",xlab="",ylab="",xaxt="n",yaxt="n",ylim=c(0,4),
       cex.axis=1.5,cex.lab=1.5,xaxs='i',yaxs='i')
  plot(function(x) dbeta(x,shape1F+2,shape2F+8),add=T,col="black",lwd=2,lty=1)
  xy <- seq(0.3,1,length=1000)
  fxy <- dbeta(xy,shape1F+2,shape2F+8)
  xyx <- c(1,0.3,xy)
  yyx <- c(0.0001,0.0001,fxy)
  polygon(xyx,yyx,col='red')
  lines(c(0.3,0.3),c(0,dbeta(0.3,shape1F+2,shape2F+8)),lwd=3)
  axis(side=1,at=c(0.12,0.3),label=c(expression(p[E]),expression(p[F])),cex.axis=1.5)
  axis(side=1,at=c(0.12,0.3),label=c(expression(paste("=",p[0])),expression(paste("=",p[1]))),cex.axis=1.5,line=1.5,lty=0)
  text(0.65,0.7,labels=expression(paste("P(p > ",p[F],"| Data)")),cex=1.5)
  lines(c(0.4,0.5),c(0.5,0.7),lwd=3)

##plot PE
  plot(function(x) x,0,0.8,add=F,type="n",col="black",xlab="",ylab="",xaxt="n",yaxt="n",ylim=c(0,4),
       cex.axis=1.5,cex.lab=1.5,xaxs='i',yaxs='i')
  plot(function(x) dbeta(x,shape1E+2,shape2E+8),add=T,col="black",lwd=2,lty=1)
  xy <- seq(0.12,1,length=1000)
  fxy <- dbeta(xy,shape1E+2,shape2E+8)
  xyx <- c(1,0.12,xy)
  yyx <- c(0.0001,0.0001,fxy)
  polygon(xyx,yyx,col='green')
  lines(c(0.12,0.12),c(0,dbeta(0.12,shape1E+2,shape2E+8)),lwd=3)
  axis(side=1,at=c(0.12,0.3),label=c(expression(p[E]),expression(p[F])),cex.axis=1.5)
  axis(side=1,at=c(0.12,0.3),label=c(expression(paste("=",p[0])),expression(paste("=",p[1]))),cex.axis=1.5,line=1.5,lty=0)
  text(0.65,0.7,labels=expression(paste("P(p > ",p[E],"| Data)")),cex=1.5)
  lines(c(0.4,0.5),c(0.5,0.7),lwd=3)

## ---- Figure 2-----------------------------------------------------------
n=20

plot(function(x) pbeta(pF,shape1=shape1F+x,shape2=shape2F+n-x,lower.tail = F)-cF,
     0,n,ylim=c(-1,1),lwd=3,
     xlab="x",ylab=expression(paste("P(p>",p[R],"|x,n = 20) - c")),col="red") 

plot(function(x) pbeta(pE,shape1=shape1E+x,shape2=shape2E+n-x,lower.tail = F)-cE,
     0,n,ylim=c(-1,1),lwd=3,col="green",add=TRUE) 
abline(h=0)
legend("bottomright",legend=c(expression(paste("Futility decision: c=",c[F],", ",p[R],"=",p[F])), 
                              expression(paste("Efficacy decision: c=",c[E],", ",p[R],"=",p[E]))),
       lty=1,col = c("red", "green"),cex=1)
abline(v=c(0:20),lty=3,col="grey")


## ---- Figure 3, fig.show='hold',fig.width=7------------------------------
nmin=4
nmax=15

plotBDP2(x="n",y="Prob0Successes",n=c(nmin,nmax),p0=p0,p1=p1)

plotBDP2(x="n",y="PostProb0or1Successes",n=c(nmin,nmax),pF=pF,shape1F=shape1F,shape2F=shape2F)

## ---- Figure 4,fig.width=6-----------------------------------------------
n=20
interim.at=10
cE=c(7500:9900)/10000

plotBDP2(x = "cE", 
         y = "PEcall", 
         n=n, interim.at=interim.at, p0=p0,p1=p1,
         pF=pF,cF=cF,pE=pE,cE=cE,
         shape1F=shape1F,shape2F=shape2F,shape1E=shape1E,shape2E=shape2E, 
         col = c("green", "red"))

## ---- Figure 5-----------------------------------------------------------
n=40
cE=0.9
cF=0.01
plotBDP2(x = "n", 
         y = "bFbE", 
         n=n,pF=pF,cF=cF,pE=pE,cE=cE,
         shape1F=shape1F,shape2F=shape2F,shape1E=shape1E,shape2E=shape2E,
         col=c("red","green"))

## ---- Figure 6,fig.width=7-----------------------------------------------
nvec=c(18:40)
interim.at=c(10,20,30)
ptrue=0.12
plotBDP2(x="n", y="PFstopEcall",
         n =nvec, interim.at = interim.at,
         pF=pF,cF=cF,pE=pE,cE=cE,ptrue=ptrue,shape1F=shape1F,shape2F=shape2F,shape1E=shape1E,shape2E=shape2E)
  
ptrue=0.3
plotBDP2(x="n", y="PFstopEcall",
         n =nvec, interim.at = interim.at,
         pF=pF,cF=cF,pE=pE,cE=cE,ptrue=ptrue,shape1F=shape1F,shape2F=shape2F,shape1E=shape1E,shape2E=shape2E)


## ---- Figure 7,fig.width=6-----------------------------------------------
n=20
interim.at=10
ptrue=c(0:40)/100
plotBDP2(x = "ptrue", y = "PEcall", 
         n=n, interim.at=interim.at, ptrue=ptrue, 
         pF=pF, cF=cF, pE=pE, cE=cE, p0=p0, p1=p1, 
         shape1F=shape1F, shape2F=shape2F, shape1E=shape1E , shape2E=shape2E , 
         col = "green")
n=30
interim.at=c(10,20)
plotBDP2(x = "ptrue", y = "PEcall", 
         n=n, interim.at=interim.at, ptrue=ptrue, 
         pF=pF, cF=cF, pE=pE, cE=cE, p0=p0, p1=p1, 
         shape1F=shape1F, shape2F=shape2F, shape1E=shape1E , shape2E=shape2E , 
         col = "red",lty=2,add=TRUE)
abline(v=0.12,col="grey",lty=2)
abline(v=0.3,col="grey",lty=2)

## ---- Figure 8,fig.width=6-----------------------------------------------
n=30
interim.at=c(10,20)
pvec=c(0:40)/100
interim.at=interim.at[interim.at<n]
plotBDP2(x="ptrue", y="ExpectedNumber",
         n=n,interim.at=interim.at,pF=pF,cF=cF,pE=pE,cE=cE,ptrue=pvec,
         shape1F=shape1F,shape2F=shape2F,col="red",ylim=c(0,n),cex.lab=1.4)
n=20
interim.at=interim.at[interim.at<n]
plotBDP2(x="ptrue", y="ExpectedNumber",
         n=n,interim.at=interim.at,pF=pF,cF=cF,pE=pE,cE=cE,ptrue=pvec,
         shape1F=shape1F,shape2F=shape2F,col="green",add=TRUE)

abline(h=20,col="grey",lty=2)
abline(h=30,col="grey",lty=2)


## ---- Figure 9,fig.width=7-----------------------------------------------
interim.at=c(10,20)
nfinal=30
  
plotBDP2(x="k",y="PredictivePower",n=nfinal,interim.at = interim.at, cE=cE,cF=cF, pE=pE,pF=pF,
                    shape1E=shape1E,shape2E=shape2E,shape1F=shape1F,shape2F=shape2F)


## ---- Figure 10----------------------------------------------------------
n=100

plotBDP2(x = "n", 
         y = "bFbE", 
         n=n,pF=pF,cF=cF,pE=pE,cE=cE,
         shape1F=shape1F,shape2F=shape2F,shape1E=shape1E,shape2E=shape2E,
         col=c("red","green"))


## ------------------------------------------------------------------------
sessionInfo()

