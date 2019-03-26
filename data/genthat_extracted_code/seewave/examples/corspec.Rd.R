library(seewave)


### Name: corspec
### Title: Cross-correlation between two frequency spectra
### Aliases: corspec
### Keywords: dplot ts

### ** Examples

## Not run: 
##D data(tico)
##D ## compare the two first notes spectra
##D a<-spec(tico,f=22050,wl=512,at=0.2,plot=FALSE)
##D c<-spec(tico,f=22050,wl=512,at=1.1,plot=FALSE)
##D op<-par(mfrow=c(2,1), mar=c(4.5,4,3,1))
##D spec(tico,f=22050,at=0.2,col="blue")
##D par(new=TRUE)
##D spec(tico,f=22050,at=1.1,col="green")
##D legend(x=8,y=0.5,c("Note A", "Note C"),lty=1,col=c("blue","green"),bty="o")
##D par(mar=c(5,4,2,1))
##D corspec(a,c, ylim=c(-0.25,0.8),xaxs="i",yaxs="i",las=1)
##D par(op)
##D ## different correlation methods give different results...
##D op<-par(mfrow=c(3,1))
##D corspec(a,c,xaxs="i",las=1, ylim=c(-0.25,0.8))
##D title("spearmann correlation (by default)")
##D corspec(a,c,xaxs="i",las=1,ylim=c(0,1),method="pearson")
##D title("pearson correlation")
##D corspec(a,c,xaxs="i",las=1,ylim=c(-0.23,0.5),method="kendall")
##D title("kendall correlation")
##D par(op)
##D ## inverting x and y does not give exactly similar results
##D op<-par(mfrow=c(2,1),mar=c(2,4,3,1))
##D corspec(a,c)
##D corspec(c,a)
##D par(op)
##D ## mel scale
##D require(tuneR)
##D data(orni)
##D orni.mel <- melfcc(orni, nbands = 256, dcttype = "t3", fbtype = "htkmel", spec_out=TRUE)
##D orni.mel.mean <- apply(orni.mel$aspectrum, MARGIN=2, FUN=mean)
##D tico.mel <- melfcc(tico, nbands = 256, dcttype = "t3", fbtype = "htkmel", spec_out=TRUE)
##D tico.mel.mean <- apply(tico.mel$aspectrum, MARGIN=2, FUN=mean)
##D corspec(orni.mel.mean, tico.mel.mean, f=22050, mel=TRUE, plot=TRUE)
## End(Not run)


