library(astro)


### Name: chipdf
### Title: The Probability Density Function for the Chi-Squared
###   Distribution
### Aliases: chipdf
### Keywords: data

### ** Examples

X = seq(0,8,len=1000)
kvals = c(1,2,3,4,6,9)
cols = c("yellow","green","turquoise","blue","purple","red")
aplot(NA, type="n", xlab=bquote(chi^2), 
ylab=bquote(paste(f[k],"(",chi^2,")",sep="")), xlim=c(0,8), 
ylim=c(0,0.5), main="Chi-Squared Probability Density Function")
grid(lty=1, col="grey90")
for(i in 1:length(kvals)){
    lines(X, chipdf(X=X, k=kvals[i]), lwd=3, col=cols[i])
}
legend("topright", legend=paste("k =",kvals), lwd=3, col=cols, 
bty="o", bg=acol("white",alpha=0.7), inset=0.04, text.font=3, 
box.col=NA)



