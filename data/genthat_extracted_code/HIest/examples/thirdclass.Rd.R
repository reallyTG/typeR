library(HIest)


### Name: thirdclass
### Title: Calculate likelihoods for early generation hybrid genotype
###   classes in a three-way hybrid zone.
### Aliases: thirdclass
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
##D P <- data.frame(Locus=rep(1:12,each=3),allele=rep(1:3,12),P1=rep(c(1,0,0),12),
##D 	P2=rep(c(0,1,0),12),P3=rep(c(0,0,1),12))
##D 
##D Est <- HIC3(G,P)
##D Class <- thirdclass(G,P)
##D HItest3(Class,Est)
##D 
##D ## now for some three-way mixes
##D G3 <- matrix(1+rbinom(200,2,.5),ncol=10)
##D Est3 <- HIC3(G3,P)
##D Class3 <- thirdclass(G3,P)
##D HItest3(Class3,Est3)   	# usually all classifications will be impossible because all 
##D 						# individuals will have nonzero contributions from each of the 
##D 						# three parentals
##D 
##D ## bias toward parental 1
##D G3 <- matrix(1+rbinom(200,2,.25),ncol=10)
##D Est3 <- HIC3(G3,P)
##D Class3 <- thirdclass(G3,P)
##D HItest3(Class3,Est3) 	# now you might have a few that look like F2's 
##D 						# between 1 and 2 (c110200)
## End(Not run)



