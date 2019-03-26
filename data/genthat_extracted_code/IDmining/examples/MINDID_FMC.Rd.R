library(IDmining)


### Name: MINDID_FMC
### Title: Functional Measure of Clustering Using the Morisita Estimator of
###   ID
### Aliases: MINDID_FMC

### ** Examples

## Not run: 
##D bf    <- Butterfly(10000)
##D bf_SP <- bf[,c(1,2,9)]
##D 
##D m      <- 2
##D scaleQ <- 5:25
##D thd    <- quantile(bf_SP$Y,probs=c(0,0.1,0.2,0.3,
##D                                    0.4,0.5,0.6,
##D                                    0.7,0.8,0.9))
##D 
##D nbr_shuf    <- 100
##D Sm_thd_shuf <- matrix(0,length(thd),nbr_shuf)
##D for (i in 1:nbr_shuf){
##D   bf_SP_shuf      <- cbind(bf_SP[,1:2],sample(bf_SP$Y,length(bf_SP$Y)))
##D   Sm_thd_shuf[,i] <- MINDID_FMC(bf_SP_shuf, scaleQ, m, thd)
##D }
##D mean_shuf <- apply(Sm_thd_shuf,1,mean)
##D 
##D dev.new(width=6, height=4)
##D matplot(1:10,Sm_thd_shuf,type="l",lty=1,col=rgb(1,0,0,0.25),
##D         ylim=c(-0.05,0.05),ylab=bquote(S[.(m)]),xaxt="n",
##D         xlab="",cex.lab=1.2)
##D axis(1,1:10,labels = FALSE)
##D text(1:10,par("usr")[3]-0.01,srt=45,ad=1,
##D      labels=c("0_100", "10_100","20_100","30_100",
##D               "40_100","50_100","60_100",
##D               "70_100","80_100","90_100"),xpd=T,font=2,cex=1)
##D mtext("Thresholds",side=1,line=3.5,cex=1.2)
##D lines(1:10,mean_shuf,type="b",col="blue",pch=19)
##D 
##D legend.text<-c("Shuffled","mean")
##D legend.pch=c(NA,19)
##D legend.lwd=c(2,2)
##D legend.col=c("red","blue")
##D legend("topleft",legend=legend.text,pch=legend.pch,lwd=legend.lwd,
##D        col=legend.col,ncol=1,text.col="black",cex=1,box.lwd=1,bg="white")
## End(Not run)



