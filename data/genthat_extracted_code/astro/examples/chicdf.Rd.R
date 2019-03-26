library(astro)


### Name: chicdf
### Title: The Cumulative Distribution Function for the Chi-Squared
###   Distribution
### Aliases: chicdf
### Keywords: data

### ** Examples

X = seq(0,8,len=1000)
kvals = c(1,2,3,4,6,9)
cols = c("yellow","green","turquoise","blue","purple","red")
aplot(NA, type="n", xlab=bquote(chi^2), 
ylab=bquote(paste(F[k],"(",chi^2,")",sep="")), xlim=c(0,8), 
ylim=c(0,1), main="Chi-Squared Cumulative Distribution Function")
grid(lty=1, col="grey90")
for(i in 1:length(kvals)){
    lines(X, chicdf(X=X, k=kvals[i]), lwd=3, col=cols[i])
}
legend("bottomright", legend=paste("k =",kvals), lwd=3, col=cols, 
bty="o", bg=acol("white",alpha=0.7), inset=0.04, text.font=3, 
box.col=NA)



