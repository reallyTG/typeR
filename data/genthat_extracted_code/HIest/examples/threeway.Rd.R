library(HIest)


### Name: threeway
### Title: Find joint maximum-likelihood estimates of ancestry and
###   heterozygosity for a sample of hybrids in a three-way hybrid zone
### Aliases: threeway
### Keywords: ~kwd1 ~kwd2

### ** Examples

	## Not run: 
##D 	## all possible 2-way crosses after 2 generations
##D G <- rbind(
##D rep(1,12),rep(1,12),               # parental 1
##D rep(2,12),rep(2,12),               # parental 2
##D rep(3,12),rep(3,12),               # parental 3
##D rep(1,12),rep(2,12),               # 1 x 2 F1
##D rep(1:2,each=6),rep(1:2,6),        # 1 x 2 F2
##D rep(1,12),rep(1:2,6),              # 1 x 1 x 2 BC
##D rep(2,12),rep(1:2,6),              # 1 x 2 x 2 BC
##D rep(1,12),rep(3,12),               # 1 x 3 F1
##D rep(c(1,3),each=6),rep(c(1,3),6),  # 1 x 3 F2
##D rep(1,12),rep(c(1,3),6),           # 1 x 1 x 3 BC
##D rep(3,12),rep(c(1,3),6),           # 1 x 3 x 3 BC
##D rep(2,12),rep(3,12),               # 2 x 3 F1
##D rep(2:3,each=6),rep(2:3,6),        # 2 x 3 F2
##D rep(3,12),rep(2:3,6),              # 2 x 3 x 3 BC
##D rep(2,12),rep(2:3,6)               # 2 x 2 x 3 BC
##D )
##D 
##D P <- data.frame(Locus=rep(1:12,each=3),allele=rep(1:3,12),
##D 	P1=rep(c(1,0,0),12),P2=rep(c(0,1,0),12),P3=rep(c(0,0,1),12))
##D 
##D mle.o <- threeway(G,P,surf=FALSE,iterations=99)
##D mle.c <- HIC3(G,P)
##D 
##D # compare the optimization (mle.o) to the closed-form (mle.c): 
##D # 99 iterations is not enough to converge on the known true values. 
##D # Try setting surf=TRUE and/or increasing iterations. 
## End(Not run)




