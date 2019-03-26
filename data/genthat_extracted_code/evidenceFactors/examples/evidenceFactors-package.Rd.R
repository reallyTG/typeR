library(evidenceFactors)


### Name: evidenceFactors-package
### Title: Reporting Tools for Sensitivity Analysis of Evidence Factors in
###   Observational Studies
### Aliases: evidenceFactors-package evidenceFactors
### Keywords: package

### ** Examples

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
plotRetentionArea(rbrd, Gamlist)
plotRejDecbyAssm(rbrd, Gamlist, Plist, alpha = 0.05)

# truncated product combination
rbrd <- retentionBrd(Plist, Gamlist, method = "Truncated", talpha = .5)
plotRetentionArea(rbrd, Gamlist)
plotRejDecbyAssm(rbrd, Gamlist, Plist, alpha = 0.05)



