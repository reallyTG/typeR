library(TraMineR)


### Name: seqdiff
### Title: Position-wise discrepancy analysis between groups of sequences
### Aliases: seqdiff print.seqdiff
### Keywords: Dissimilarity-based analysis

### ** Examples

## Define a state sequence object
data(mvad)
## First 12 months of first 200 trajectories
mvad.seq <- seqdef(mvad[1:200, 17:28])

## Position-wise discrepancy analysis
mvad.diff <- seqdiff(mvad.seq, group=mvad$gcse5eq[1:200])
print(mvad.diff)
plot(mvad.diff, stat=c("Pseudo R2", "Levene"), xtstep=6)
plot(mvad.diff, stat="discrepancy")



