library(SoilR)


### Name: RothCModel
### Title: Implementation of the RothCModel
### Aliases: RothCModel

### ** Examples

  t=0:500 
  Ex=RothCModel(t)
  Ct=getC(Ex)
  Rt=getReleaseFlux(Ex)
  
 plot(
   t,
   Ct[,1],
   type="l",
   col=1,
    ylim=c(0,25),
   ylab=expression(paste("Carbon stores (Mg C", ha^-1,")")),
   xlab="Time (years)",
   lwd=2
 ) 
 lines(t,Ct[,2],col=2,lwd=2,lty=2) 
 lines(t,Ct[,3],col=3,lwd=2,lty=3)
 lines(t,Ct[,4],col=4,lwd=2,lty=4)
 lines(t,Ct[,5],col=5,lwd=2,lty=5)
 lines(t,rowSums(Ct),lwd=2)
 legend(
    "topright",
    c(
      "Pool 1, DPM",
      "Pool 2, RPM",
      "Pool 3, BIO",
      "Pool 4, HUM",
      "Pool 5, IOM",
      "Total Carbon"
    ),
    lty=c(1:5,1),
    lwd=rep(2,5),
    col=c(1,2,3,4,5,"black")
    ,bty="n"
)

 plot(t,Rt[,1],type="l",ylim=c(0,2),ylab="Respiration (Mg C ha-1 yr-1)",xlab="Time") 
 lines(t,Rt[,2],col=2) 
 lines(t,Rt[,3],col=3) 
 lines(t,Rt[,4],col=4) 
 lines(t,Rt[,5],col=5) 
 lines(t,rowSums(Rt),lwd=2) 
 legend(
    "topright",
    c("Pool 1, DPM", 
      "Pool 2, RPM",
      "Pool 3, BIO",
      "Pool 4, HUM",
      "Pool 5, IOM",
      "Total Respiration"
    ), 
    lty=c(1,1,1,1,1,1),
    lwd=c(1, 1,1,1,1,2),
    col=c(1,2,3,4,5,1),
    bty="n"
  )




