## ----setup, echo = FALSE, message = FALSE--------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>")
options(tibble.print_min = 4L, tibble.print_max = 4L)

## ----Motivation, fig.cap="Gene ORF06806",fig.width=5,fig.height=3,echo=FALSE----
library(ptest)
data(Cc)
x <- Cc[which(rownames(Cc)=="ORF06806"),]

plot(1:length(x),x,type="b",
     xlab="time",ylab="Gene expression")

## ----Fit harmonic--------------------------------------------------------
#simulate a harmonic series
set.seed(193)
#Non-Fourier frequency
z <- simHReg(n = 14, f=2/10, A = 2, B = 1, model="Gaussian",sig=1) 
fitHReg(z,algorithm="enumerative") 
fitHReg(z,algorithm = "exact") 

## ----boot test-----------------------------------------------------------
#Bootstrap the series under the null hypothesis: No periodicity 
set.seed(193)
library(boot)
LRStat <- function(d, i){    
  fitHReg(d[i],algorithm = "enumerative")$LRStat
}
bootResult <- boot(data = z, statistic = LRStat, R = 1000)
bootResult
#Compute the p-value
mean(bootResult$t>=fitHReg(z,algorithm="enumerative")$LRStat) #0.001


## -----2LLR---------------------------------------------------------------
ptestReg(z,method = "LS") #Normal likelihood ratio test
ptestReg(z,method = "L1") #Laplace likelihood ratio test 

## ----Fisher--------------------------------------------------------------
ptestg(z,method="Fisher")

## ----rank----------------------------------------------------------------
ptestg(z,method="robust")
#extend the frequency searching region to be En
ptestg(z,method="extendedRobust")

## ----extend--------------------------------------------------------------
ptestg(z,method="extended")

## ----sim-----------------------------------------------------------------
# Effiency Comparison for testing 10^5 series with length 20
set.seed(193)
X <- matrix(rnorm(20*10^5),nrow = 10)

## ----GeneCycle,eval=FALSE------------------------------------------------
#  ## MC method for the robust g test
#  library(GeneCycle)
#  # # The original robust g test performs 10^5 MC simualtions,
#  # # but we need 100*10^5 to achieve the same accuracy as
#  # # the RSR method.
#  # # This process is time-consuming.
#  # t1 <- proc.time()
#  # RX <- robust.spectrum(X)
#  # pval1 <- robust.g.test(RX)
#  # t1 <- proc.time()-t1
#  #
#  # t1
#  ##>    user  system elapsed
#  ##>  343.42    2.09  348.78
#  #unlink("g_pop_length_10.txt") # delete the external files

## ----RSR,eval=FALSE------------------------------------------------------
#  ## RSR method for the robust g test
#  library(ptest)
#  t2 <- proc.time()
#  pval2 <- ptestg(X,method="robust",multiple = TRUE)
#  t2 <- proc.time()-t2
#  
#  t2
#   #   user system  elapsed
#   # 208.97   0.17  218.42

## ----CDFFisherG, fig.show='hold', fig.width=7, fig.height=3.6------------
#For a series of length 10, it is by the definition of the g statistic that 
#the range of g should be between 1/n and 1.
n <- 10
g <- seq(0.01,0.99,length.out = 200)

#Compute the CDF from the exact distribution and the RSR method
cdfExact <- pFisherg(g,n,method="exact")
cdfRSR <- pFisherg(g,n,method="RSR")


plot(g,cdfExact,col="red",type="l", cex=1.2,
     main = "Compare the exact CDF and the RSR CDF for Fisher's g (n=10)")
lines(g,cdfRSR,col="blue",type="b",pch=19,cex=0.3)
legend("topleft",legend = c("Exact","RSR"), 
       col = c("red","blue"), lty = c(1,NA),
       pch = c(NA, 19))


## ---- fig.width=8.1, fig.height=4,fig.cap="Absolute difference between CDFs"----
set.seed(193)
zsim <- matrix(rnorm(10*10^5),nrow=10,ncol=10^5)
gSample <- ptestg(zsim,method="Fisher",multiple = TRUE)$obsStat
distMC <- ecdf(gSample)
cdfMC <- distMC(g)

#It is not of interest to compare thoes values which are less than 0.00001 
#or larger than 0.99999 as the 10^6 Monte Carlo simulations here does not 
#enable a reliable estimation for them.
pos <- which( (cdfExact>=0.00001)&(cdfExact<=0.99999) )
diff1 <- log(abs(cdfExact[pos]-cdfRSR[pos]),base = 10)
diff2 <- log(abs(cdfExact[pos]-cdfMC[pos]),base = 10)
comFig <- data.frame(cdfExact = cdfExact[pos],
                     diff=c(diff1,diff2),
                     type=rep(c("RSR v.s. Exact","MC v.s. Exact"),
                              each=length(diff1)))

library(lattice)
ans <- xyplot(diff ~ cdfExact | type, data=comFig,
       panel=function(x,y){
        panel.grid(h=4, v= 4,col=rgb(0.5,0.5,0.5,0.5))
        panel.xyplot(x, y, pch=16,cex=0.7)
       }, ylab="Absolute diference (log10)", xlab="g")
ans


## ----include=FALSE-------------------------------------------------------
# par(mfrow=c(1,2))
# plot(g[pos], diff1,
#      xlab = "g",
#      ylab = "absolute diference (log10)",
#      main = "The Exact v.s. RSR",
#      ylim = c(-7,-2))
# 
# plot(g[pos], diff2,
#      xlab = "g",
#      ylab = "absolute diference (log10)",
#      main = "The Exact v.s. MC",
#      ylim = c(-7,-2))
# par(mfrow=c(1,1))

## ----Motivation2, fig.cap="Gene ORF06806",fig.width=5,fig.height=3-------
data(Cc)
x <- Cc[which(rownames(Cc)=="ORF06806"),]
plot(1:length(x),x,type="b",
     xlab="time",ylab="Gene expression")

## ----allTest-------------------------------------------------------------
ptestg(x,method="Fisher") #Fail to detect
ptestg(x,method="robust")
ptestg(x,method="extended")
ptestReg(x,method="LS")
ptestReg(x,method="L1")


X <- Cc[complete.cases(Cc),]
pvalue <- ptestg(t(X),method="Fisher",multiple = TRUE)

head(sort(pvalue$pvalue))


