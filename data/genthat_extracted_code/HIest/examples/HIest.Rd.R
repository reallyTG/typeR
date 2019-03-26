library(HIest)


### Name: HIest
### Title: Find the joint maximum likelihood estimates of ancestry and
###   interclass heterozygosity in a sample of hybrids.
### Aliases: HIest
### Keywords: ~kwd1 ~kwd2

### ** Examples

##-- A random codominant data set of 5 individuals and 5 markers with three alleles each
L <- 10
P <- data.frame(Locus=rep(1:L,each=3),Allele=rep(1:3,L),
	P1=as.vector(rmultinom(L,10,c(.7,.2,.1)))/10, 
	P2=as.vector(rmultinom(L,10,c(.1,.2,.7)))/10)
G <- matrix(nrow=10,ncol=L)
for(i in 1:L){
	G[,i] <- sample(c(1,2,3),size=10,replace=TRUE,prob=rowMeans(P[P$Locus==i,3:4]))
	}
	
HI.cod <- HIest(G,P,type="codominant",iterations=99,surf=TRUE,startgrid=20)

# this is unlikely to converge on the MLE: increase iterations and/r startgrid.

# # optional plot
# plot(c(0,.5,1,0),c(0,1,0,0),type="l",xlab=expression(italic(S)),
	# ylab=expression(italic(H[I])),lwd=2,cex.lab=1.5,cex.axis=1.5,bty="n")
# points(HI.cod$S,HI.cod$H,cex=1.5,lwd=2)
# axis(1,labels=FALSE,lwd=2);axis(2,labels=FALSE,lwd=2)

# # other examples

# ##-- Make it into allele count data (count "3" alleles)
# P.c <- P[seq(from=3,to=dim(P)[2],by=3),]
# G.c <- matrix(nrow=5,ncol=L)
# for(i in 1:5){
	# G.c[i,] <- colSums(G[c(i*2-1,i*2),]==3)
	# }

# HI.ac <- HIest(G.c,P.c,type="allele.count",iterations=500,surf=TRUE,startgrid=50)

# ##-- Make it into dominant data where allele 3 is dominant
# G.d <- replace(G.c,G.c==2,1)

# HI.dom <- HIest(G.d,P.c,type="dominant",iterations=500,surf=TRUE,startgrid=50)

# ## -- A real dataset (Fitzpatrick et al. 2009)
# data(Bluestone)
# Bluestone <- replace(Bluestone,is.na(Bluestone),-9)
# # parental allele frequencies (assumed diagnostic)
# BS.P <- data.frame(Locus=names(Bluestone),Allele="BTS",P1=1,P2=0)

# # estimate ancestry and heterozygosity
# # BS.est <-HIest(Bluestone,BS.P,type="allele.count")
# ## shortcut for diagnostic markers
# BS.est <- HIC(Bluestone)

# # calculate likelihoods for early generation hybrid classes
# BS.class <- HIclass(Bluestone,BS.P,type="allele.count")

# # compare classification with maximum likelihood estimates
# BS.test <- HItest(BS.class,BS.est)

# table(BS.test$c1)
# # all 41 are TRUE, meaning the best classification is at least 2 log-likelihood units
# # better than the next best

# table(BS.test$c2)
# # 2 are TRUE, meaning the MLE S and H are within 2 log-likelihood units of the best
# # classification, i.e., the simple classification is rejected in all but 2 cases

# table(BS.test$Best.class,BS.test$c2)
# # individuals were classified as F2-like (class 3) or backcross to CTS (class 4), but
# # only two of the F2's were credible 

# BS.test[BS.test$c2,]
# # in only one case was the F2 classification a better fit (based on AIC) than the
# # continuous model.





