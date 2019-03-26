library(eegkit)


### Name: eegsim
### Title: Simulate Event-Related Potential EEG Data
### Aliases: eegsim

### ** Examples

##########   EXAMPLE   ##########

### plot spatiotemporal component functions

# data(eegcoord)
# chnames <- rownames(eegcoord)
# tseq <- seq(0,1,length.out=200)

# quartz(width=18,height=6)
# layout(matrix(c(1,2,3,4,5,6,7,8,9,10,11,11), 2, 6, byrow = TRUE))

# eegspace(eegcoord[,4:5],p1s(chnames),cex.point=1,main=expression(psi[p1]),cex.main=2,vlim=c(-3,9))
# eegtime(tseq,p1t(tseq),ylim=c(-1,1),asp=1/2,main=expression(tau[p1]),cex.main=2,
#         xlab="Time After Stimulus (sec)")
# eegspace(eegcoord[,4:5],p2s(chnames),cex.point=1,main=expression(psi[p2]),cex.main=2,vlim=c(-3,9))
# eegtime(tseq,p2t(tseq),ylim=c(-1,1),asp=1/2,main=expression(tau[p2]),cex.main=2,
#         xlab="Time After Stimulus (sec)")
# eegspace(eegcoord[,4:5],p3s(chnames),cex.point=1,main=expression(psi[p3]),cex.main=2,vlim=c(-3,9))
# eegtime(tseq,p3t(tseq),ylim=c(-1,1),asp=1/2,main=expression(tau[p3]),cex.main=2,
#         xlab="Time After Stimulus (sec)")
# eegspace(eegcoord[,4:5],n1s(chnames),cex.point=1,main=expression(psi[n1]),cex.main=2,vlim=c(-3,9))
# eegtime(tseq,n1t(tseq),ylim=c(-1,1),asp=1/2,main=expression(tau[n1]),cex.main=2,
#         xlab="Time After Stimulus (sec)")
# eegspace(eegcoord[,4:5],n2s(chnames),cex.point=1,main=expression(psi[n2]),cex.main=2,vlim=c(-3,9))
# eegtime(tseq,n2t(tseq),ylim=c(-1,1),asp=1/2,main=expression(tau[n2]),cex.main=2,
#         xlab="Time After Stimulus (sec)")
# plot(seq(-10,10),seq(-10,10),type="n",axes=FALSE,xlab="",ylab="")
# text(0,8,labels=expression(omega[p1]*" = "*psi[p1]*tau[p1]),cex=2)
# text(0,4,labels=expression(omega[n1]*" = "*psi[n1]*tau[n1]),cex=2)
# text(0,0,labels=expression(omega[p2]*" = "*psi[p2]*tau[p2]),cex=2)
# text(0,-4,labels=expression(omega[n2]*" = "*psi[n2]*tau[n2]),cex=2)
# text(0,-8,labels=expression(omega[p3]*" = "*psi[p3]*tau[p3]),cex=2)



### plot simulated data at various time points

# quartz(width=15,height=3)
# tseq <- c(50,150,250,350,450)/1000
# par(mfrow=c(1,5))
# for(j in 1:5){
#   eegspace(eegcoord[,4:5],eegsim(chnames,rep(tseq[j],87)),vlim=c(-6.8,5.5),
#            main=paste(tseq[j]*1000," ms"),cex.main=2)
# }




