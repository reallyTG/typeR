library(HIest)


### Name: HIsurf
### Title: Describe the joint likelihood surface of ancestry and
###   heterozygosity for a hybrid genotype.
### Aliases: HIsurf
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(Bluestone)
Bluestone <- replace(Bluestone,is.na(Bluestone),-9)
# parental allele frequencies (assumed diagnostic)
BS.P <- data.frame(Locus=names(Bluestone),Allele="BTS",P1=1,P2=0)

# a small surface to view in the console
BS.surf.5 <- HIsurf(Bluestone[21,],BS.P,type="allele.count",size=5)
BS.surf.5 # the maximum likelihood is very near the center (S ~ H ~ 0.5)

# # a more finely sampled surface to visualize with image
# BS.surf <- HIsurf(Bluestone[21,],BS.P,type="allele.count",size=99)

# image(-BS.surf,col=gray(seq(from=0,to=1,length.out=6)),
	# breaks=seq(from=min(-BS.surf,na.rm=TRUE),by=2,length.out=7),
	# cex.axis=1.5,bty="n",xaxs="r",yaxs="r")
# # the breaks option is set so that each level of shading corresponds to 2 log-likelihood
# # units (for one unit increments, set by=1).
# # now make it pretty:
# image(is.na(BS.surf),col="light blue",breaks=c(.5,1),add=TRUE)
# axis(1,labels=FALSE,lwd=2); axis(2,labels=FALSE,lwd=2)
# title(xlab=expression(italic(S)),ylab=expression(italic(H[I])),cex.lab=1.5)
# lines(c(0,.5,1,0),c(0,1,0,0),lty=2,lwd=2)




