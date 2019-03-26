library(STAR)


### Name: dllogis
### Title: The Log Logistic Distribution
### Aliases: dllogis pllogis qllogis rllogis
### Keywords: distribution ts

### ** Examples

## Not run: 
##D tSeq <- seq(0.001,0.6,0.001)
##D location.true <- -2.7
##D scale.true <- 0.025
##D Yd <- dllogis(tSeq, location.true, scale.true)
##D Yh <- hllogis(tSeq, location.true, scale.true)
##D max.Yd <- max(Yd)
##D max.Yh <- max(Yh)
##D Yd <- Yd / max.Yd
##D Yh <- Yh / max.Yh
##D oldpar <- par(mar=c(5,4,4,4))
##D plot(tSeq, Yd, type="n", axes=FALSE, ann=FALSE,
##D      xlim=c(0,0.6), ylim=c(0,1))
##D axis(2,at=seq(0,1,0.2),labels=round(seq(0,1,0.2)*max.Yd,digits=2))
##D mtext("Density (1/s)", side=2, line=3)
##D axis(1,at=pretty(c(0,0.6)))
##D mtext("Time (s)", side=1, line=3)
##D axis(4, at=seq(0,1,0.2), labels=round(seq(0,1,0.2)*max.Yh,digits=2))
##D mtext("Hazard (1/s)", side=4, line=3, col=2)
##D mtext("Log Logistic Density and Hazard Functions", side=3, line=2,cex=1.5)
##D lines(tSeq,Yd)
##D lines(tSeq,Yh,col=2)
##D par(oldpar)
## End(Not run)



