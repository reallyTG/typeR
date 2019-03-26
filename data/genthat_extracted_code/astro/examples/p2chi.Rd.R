library(astro)


### Name: p2chi
### Title: The Chi-Squared Statistic for a Given P-Value
### Aliases: p2chi
### Keywords: data

### ** Examples

X = seq(0,20,len=1000)
kvals = c(1,2,3,4,6,9)
cols = c("yellow","green","turquoise","blue","purple","red")
for(i in 1:length(kvals)){
    psig = p2chi(p=0.05, k=kvals[i])
    pgood = seq(0,psig,len=100)
    pbad = seq(psig,max(X),len=100)
    aplot(X, chipdf(X=X, k=kvals[i]), type="n", xlab=bquote(chi^2), 
    ylab=bquote(paste(f[k],"(",chi^2,")",sep="")), 
    ylim=c(0,min(0.5,max(chipdf(X=X, k=kvals[i])))), 
    main="Chi-Squared Probability Density Function")
    polygon(x=c(pgood,rev(pgood)), 
    y=c(chipdf(pgood, k=kvals[i]),rep(0,len=length(pgood))), 
    col=acol("yellow",alpha=0.5), border=NA)
    polygon(x=c(pbad,rev(pbad)), 
    y=c(chipdf(pbad, k=kvals[i]),rep(0,len=length(pbad))), 
    col=acol("turquoise",alpha=0.5), border=NA)
    lines(X, chipdf(X=X, k=kvals[i]), lwd=3, col=cols[i])
    legend("topright", 
    legend=c("p >= 0.05 (data consistent with null hypothesis)", 
    "p < 0.05 (reject null hypothesis)"), bty="o", 
    bg=acol("white",alpha=0.7), inset=0.04, text.font=3, box.col=NA, 
    fill=acol(c("yellow","turquoise"),alpha=0.5), border=NA)
    legend("right", legend=paste("k =",kvals[i]), lwd=3, col=cols[i], 
    bty="o", bg=acol("white",alpha=0.7), inset=0.04, text.font=3, 
    box.col=NA)
}



