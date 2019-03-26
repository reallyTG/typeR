library(mmpp)


### Name: coocmetric
### Title: Metrics for Point Process Realizations Based on Co-occurrence
### Aliases: coocmetric

### ** Examples

## The aftershock data of 26th July 2003 earthquake of M6.2 at the northern Miyagi-Ken Japan.
data(Miyagi20030626)
## time longitude latitude depth magnitude
## split events by 7-hour
sMiyagi <- splitMPP(Miyagi20030626,h=60*60*7,scaleMarks=TRUE)$S
N <- 10
sMat <- matrix(0,N,N)
tau<-0.2
  cat("calculating coocmetric(smooth)...")
 for(i in 1:(N)){
   cat(i," ")
   for(j in i:N){
     S1 <- sMiyagi[[i]]$time;S2 <- sMiyagi[[j]]$time
    sMat[i,j] <- coocmetric(S1,S2,type="smooth",tau=tau,M=diag(1,4))
   }
 }
 sMat <- sMat+t(sMat)
 tmpd <- diag(sMat) <- diag(sMat)/2
 sMat <- sMat/sqrt(outer(tmpd,tmpd))
image(sMat)



