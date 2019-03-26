library(gap)


### Name: mhtplot2
### Title: Manhattan plot with annotations
### Aliases: mhtplot2
### Keywords: hplot

### ** Examples

## Not run: 
##D # The following example uses only chromosomes 14 and 20 of the Nat Genet paper.
##D #
##D mdata <- within(hr1420,{
##D   c1<-colour==1
##D   c2<-colour==2
##D   c3<-colour==3
##D   colour[c1] <- 62
##D   colour[c2] <- 73
##D   colour[c3] <- 552
##D })
##D mdata <- mdata[,c("CHR","POS","P","gene","colour")]
##D ops <- mht.control(colors=rep(c("lightgray","gray"),11),yline=1.5,xline=2,srt=0)
##D hops <- hmht.control(data=subset(mdata,!is.na(gene)))
##D v <- "Verdana"
##D ifelse(Sys.info()['sysname']=="Windows", windowsFonts(ffamily=windowsFont(v)),
##D        ffamily <- v)
##D tiff("mh.tiff", width=.03937*189, height=.03937*189/2, units="in", res=1200,
##D      compress="lzw")
##D par(las=2, xpd=TRUE, cex.axis=1.8, cex=0.4)
##D mhtplot2(with(mdata,cbind(CHR,POS,P,colour)),ops,hops,pch=19,
##D          ylab=expression(paste(plain("-"),log[10],plain("p-value"),sep=" ")),
##D          family="ffamily")
##D axis(2,pos=2,at=seq(0,25,5),family="ffamily",cex=0.5,cex.axis=1.1)
##D dev.off()
##D 
##D # To exemplify the use of chr, pos and p without gene annotation
##D # in response to query from Vallejo, Roger <Roger.Vallejo@ARS.USDA.GOV>
##D opar <- par()
##D par(cex=0.4)
##D ops <- mht.control(colors=rep(c("lightgray","lightblue"),11),srt=0,yline=2.5,xline=2)
##D mhtplot2(data.frame(mhtdata[,c("chr","pos","p")],gene=NA,color=NA),ops,xlab="",ylab="",srt=0)
##D axis(2,at=1:16)
##D title("data in mhtplot used by mhtplot2")                 
##D par(opar)
## End(Not run)



