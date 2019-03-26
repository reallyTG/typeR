library(HIest)


### Name: HIC3
### Title: Closed form maximum-likelihood estimates of ancestry and
###   heterozygosity for diagnostic markers in a three-way hybrid zone
### Aliases: HIC3
### Keywords: ~kwd1 ~kwd2

### ** Examples

	## all possible 2-way crosses after 2 generations
G <- rbind(
rep(1,12),rep(1,12),               # parental 1
rep(2,12),rep(2,12),               # parental 2
rep(3,12),rep(3,12),               # parental 3
rep(1,12),rep(2,12),               # 1 x 2 F1
rep(1:2,each=6),rep(1:2,6),        # 1 x 2 F2
rep(1,12),rep(1:2,6),              # 1 x 1 x 2 BC
rep(2,12),rep(1:2,6),              # 1 x 2 x 2 BC
rep(1,12),rep(3,12),               # 1 x 3 F1
rep(c(1,3),each=6),rep(c(1,3),6),  # 1 x 3 F2
rep(1,12),rep(c(1,3),6),           # 1 x 1 x 3 BC
rep(3,12),rep(c(1,3),6),           # 1 x 3 x 3 BC
rep(2,12),rep(3,12),               # 2 x 3 F1
rep(2:3,each=6),rep(2:3,6),        # 2 x 3 F2
rep(3,12),rep(2:3,6),              # 2 x 3 x 3 BC
rep(2,12),rep(2:3,6)               # 2 x 2 x 3 BC
)

P <- data.frame(Locus=rep(1:12,each=3),allele=rep(1:3,12),P1=rep(c(1,0,0),12),
	P2=rep(c(0,1,0),12),P3=rep(c(0,0,1),12))

HIC3(G,P)




