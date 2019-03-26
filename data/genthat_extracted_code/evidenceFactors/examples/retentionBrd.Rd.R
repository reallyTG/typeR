library(evidenceFactors)


### Name: retentionBrd
### Title: Computes the Multiplicity Controlled Retention Set.
### Aliases: retentionBrd
### Keywords: Sensitivity Analysis Evidence Factors

### ** Examples


data(Plist)
data(Gamlist)
retentionBrd(Plist, Gamlist)
retentionBrd(Plist, Gamlist, method = "Truncated")

## mean tail moment data example
library(sensitivitymv)

data(mtm)
Gamseq <- seq(1, 15, by = 0.2)
Gamlist <- list(Gamseq, Gamseq)
Plist <- list(c(), c())

for(gam in Gamseq){
	Plist[[1]] = c(Plist[[1]], senmv(-mtm,gamma=gam,trim=1)$pval)
	Plist[[2]] = c(Plist[[2]], senmv(-mtm[,2:3],gamma=gam,trim=1)$pval)
}	

# Fisher's combination method
rbrd <- retentionBrd(Plist, Gamlist)

# truncated product combination
rbrd <- retentionBrd(Plist, Gamlist, method = "Truncated", talpha = .5)



