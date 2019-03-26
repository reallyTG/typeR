library(evidenceFactors)


### Name: plotRejDecbyAssm
### Title: Plots labelling which assumption provides the evidence
### Aliases: plotRejDecbyAssm
### Keywords: Sensitivity Analysis Evidence Factors

### ** Examples


data(Plist)
data(Gamlist)
rbrd = retentionBrd(Plist, Gamlist)
plotRejDecbyAssm(rbrd, Gamlist, Plist)

rbrd = retentionBrd(Plist, Gamlist, method = "Truncated")
plotRejDecbyAssm(rbrd, Gamlist, Plist)

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
plotRejDecbyAssm(rbrd, Gamlist, Plist)

# truncated product combination
rbrd <- retentionBrd(Plist, Gamlist, method = "Truncated", talpha = .5)
plotRejDecbyAssm(rbrd, Gamlist, Plist)



