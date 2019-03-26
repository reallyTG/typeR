library(astro)


### Name: chipval
### Title: The P-Value for the Chi-Squared Distribution
### Aliases: chipval
### Keywords: data

### ** Examples

X = seq(0,20,by=1)
kvals = c(1,2,3,4,6,9)
par("mar"=c(1,1,3,1))
plot(NA, type="n", xlim=c(-0.5,6.5), ylim=c(21.5,-0.5), axes=FALSE, 
xlab="", ylab="", xaxs="i", yaxs="i", main="P-Value Lookup Table")
text(x=0, y=0, labels=bquote(chi^2))
for(i in 1:length(kvals)){
    text(x=i, y=0, labels=paste("k =",kvals[i]))
}
abline(v=seq(0.5,length(kvals)-0.5,by=1), col="grey90", lwd=3)
for(i in 1:length(X)){
    text(x=0, y=i, labels=paste(X[i]))
}
abline(h=seq(0.5,length(X)-0.5,by=1), col="grey90", lwd=3)
cols = acol(colorRampPalette(c("green","red"))(100),alpha=0.5)
for(i in 1:length(X)){
    for(j in 1:length(kvals)){
        p = chipval(X=X[i], k=kvals[j])
        col = ((p^0.35)*(length(cols)-1))+1
        rect(xleft=j-0.5, xright=j+0.5, ybottom=i-0.5, ytop=i+0.5, 
        col=cols[col], border=NA)
        text(x=j, y=i, labels=formatC(p,format="f",digits=3))
    }
}
par("mar"=c(5.1,4.1,4.1,2.1))



