library(mmpp)


### Name: ieimetric
### Title: Compute Inter Event Interval-based Metric Between Marked Point
###   Processes
### Aliases: ieimetric

### ** Examples

##The aftershock data of 26th July 2003 earthquake of M6.2 at the northern Miyagi-Ken Japan.
data(Miyagi20030626)
## time longitude latitude depth magnitude
## split events by 7-hour
sMiyagi <- splitMPP(Miyagi20030626,h=60*60*7,scaleMarks=TRUE)$S
N <- 5
sMat <- matrix(0,N,N)
  cat("calculating intensity inner product...")
 for(i in 1:(N)){
   cat(i," ")
   for(j in i:N){
     S1 <- sMiyagi[[i]]$time;S2 <- sMiyagi[[j]]$time
    sMat[i,j] <- ieimetric(S1,S2,M=diag(1,4))
   }
 }
 sMat <- sMat+t(sMat)
 tmpd <- diag(sMat) <- diag(sMat)/2
 sMat <- sMat/sqrt(outer(tmpd,tmpd))
image(sMat)



