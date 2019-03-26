library(MFDFA)


### Name: MFDFA
### Title: MultiFractal Detrended Fluctuation Analysis
### Aliases: MFDFA

### ** Examples


## Not run: 
##D ## MFDFA package installation: from github ####
##D 
##D install.packages("devtools")
##D 
##D devtools::install_github("mlaib/MFDFA")
## End(Not run)
library(MFDFA)

a<-0.9
N<-1024
tsx<-MFsim(N,a)

scale=10:100
q<--10:10
m<-1
mfdfa<-MFDFA(tsx, scale, m, q)

## Not run: 
##D ## Results plot ####
##D dev.new()
##D par(mai=rep(1, 4))
##D plot(q, mfdfa$Hq, col=1, axes= F, ylab=expression('h'[q]), pch=16, cex.lab=1.8,
##D      cex.axis=1.8, main="Hurst exponent",
##D      ylim=c(min(mfdfa$Hq),max(mfdfa$Hq)))
##D grid(col="midnightblue")
##D axis(1)
##D axis(2)
##D 
##D ##################################
##D ## Suggestion of output plot: ####
##D ##################################
##D 
##D ##################################
##D ## Supplementary functions: #####
##D reset <- function(){
##D par(mfrow=c(1, 1), oma=rep(0, 4), mar=rep(0, 4), new=TRUE)
##D plot(0:1, 0:1, type="n", xlab="", ylab="", axes=FALSE)}
##D 
##D poly_fit<-function(x,y,n){
##D   formule<-lm(as.formula(paste('y~',paste('I(x^',1:n,')', sep='',collapse='+'))))
##D   res1<-coef(formule)
##D   poly.res<-res1[length(res1):1]
##D   allres<-list(polyfit=poly.res, model1=formule)
##D   return(allres)}
##D ##################################
##D 
##D ##################################
##D ## Output plots: #################
##D dev.new()
##D layout(matrix(c(1,2,3,4), 2, 2, byrow = TRUE),heights=c(4, 4))
##D ## b : mfdfa output
##D par(mai=rep(0.8, 4))
##D ## 1st plot: Scaling function order Fq (q-order RMS)
##D p1<-c(1,which(q==0),which(q==q[length(q)]))
##D plot(log2(scale),log2(b$Fqi[,1]),  pch=16, col=1, axes = F, xlab = "s (days)",
##D      ylab=expression('log'[2]*'(F'[q]*')'), cex=1, cex.lab=1.6, cex.axis=1.6,
##D      main= "Fluctuation functionFq",
##D      ylim=c(min(log2(b$Fqi[,c(p1)])),max(log2(b$Fqi[,c(p1)]))))
##D 
##D lines(log2(scale),b$line[,1], type="l", col=1, lwd=2)
##D grid(col="midnightblue")
##D axis(2)
##D lbl<-scale[c(1,floor(length(scale)/8),floor(length(scale)/4),
##D              floor(length(scale)/2),length(scale))]
##D att<-log2(lbl)
##D axis(1, at=att, labels=lbl)
##D for (i in 2:3){
##D   k<-p1[i]
##D   points(log2(scale), log2(b$Fqi[,k]),  col=i,pch=16)
##D   lines(log2(scale),b$line[,k], type="l", col=i, lwd=2)
##D }
##D 
##D legend("bottomright", c(paste('q','=',q[p1] , sep=' ' )),cex=2,lwd=c(2,2,2),
##D  bty="n", col=1:3)
##D 
##D 
##D 
##D ## 2nd plot: q-order Hurst exponent
##D 
##D plot(q, b$Hq, col=1, axes= F, ylab=expression('h'[q]), pch=16, cex.lab=1.8,
##D     cex.axis=1.8, main="Hurst exponent", ylim=c(min(b$Hq),max(b$Hq)))
##D grid(col="midnightblue")
##D axis(1, cex=4)
##D axis(2, cex=4)
##D 
##D ## 3rd plot: q-order Mass exponent
##D plot(q, b$tau_q, col=1, axes=F, cex.lab=1.8, cex.axis=1.8,
##D      main="Mass exponent",
##D      pch=16,ylab=expression(tau[q]))
##D 
##D grid(col="midnightblue")
##D axis(1, cex=4)
##D axis(2, cex=4)
##D 
##D 
##D ## 4th plot: Multifractal spectrum
##D 
##D plot(b$spec$hq, b$spec$Dq, col=1, axes=F, pch=16, #main="Multifractal spectrum",
##D      ylab=bquote("f ("~alpha~")"),cex.lab=1.8, cex.axis=1.8,
##D      xlab=bquote(~alpha))
##D 
##D grid(col="midnightblue")
##D axis(1, cex=4)
##D axis(2, cex=4)
##D 
##D x1=b$spec$hq
##D y1=b$spec$Dq
##D rr<-poly_fit(x1,y1,4)
##D mm1<-rr$model1
##D mm<-rr$polyfit
##D x2<-seq(0,max(x1)+1,0.01)
##D curv<-mm[1]*x2^4+mm[2]*x2^3+mm[3]*x2^2+mm[4]*x2+mm[5]
##D lines(x2,curv, col="red", lwd=2)
##D reset()
##D legend("top", legend="MFDFA Plots", bty="n", cex=2)
## End(Not run)



