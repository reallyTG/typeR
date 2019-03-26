library(HIest)


### Name: HILL
### Title: Hybrid Index Log Likelihood
### Aliases: HILL
### Keywords: ~kwd1 ~kwd2

### ** Examples

##-- A random codominant data set of 1 individual with 5 markers with three possible alleles each
P <- data.frame(Locus=rep(1:5,each=3),Allele=rep(1:3,5),
	P1=as.vector(rmultinom(5,10,c(.7,.2,.1)))/10, 
	P2=as.vector(rmultinom(5,10,c(.1,.2,.7)))/10)
G <- matrix(nrow=2,ncol=5)
for(i in 1:5){
	G[,i] <- sample(c(1,2,3),size=2,replace=TRUE,prob=rowMeans(P[P$Locus==i,3:4]))
	}
	
HILL(par=c(0.5,0.5),G,P,type="codominant")

##-- Make it into allele count data (count "3" alleles)
P.c <- P[seq(from=3,to=15,by=3),]
G.c <- colSums(G==3)

HILL(par=c(0.5,0.5),G.c,P.c,type="allele.count")

##-- Make it into dominant data where allele 3 is dominant
G.d <- replace(G.c,G.c==2,1)

HILL(par=c(0.5,0.5),G.d,P.c,type="dominant")




