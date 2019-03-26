library(PST)


### Name: impute
### Title: Impute missing values using a probabilistic suffix tree
### Aliases: impute impute,PSTf,stslist-method
### Keywords: models datagen

### ** Examples

## Loading the SRH.seq sequence object
data(SRH)

## working with a sub-sample of 500 sequences
## to reduce computing time
subs <- sample(nrow(SRH.seq), size=500)
SRH.sub.seq <- SRH.seq[subs,]

## Learning the model (missing state is not included)
SRH.pst.L10 <- pstree(SRH.sub.seq, nmin=2, ymin=0.001)

## Pruning
C99 <- qchisq(0.99,5-1)/2
SRH.pst.L10.C99 <- prune(SRH.pst.L10, gain="G2", C=C99)

## Imputing missing values in the SRH sequences
SRH.sub.iseq <- impute(SRH.pst.L10, SRH.sub.seq, method="prob")

## locating sequences having missing values
## in sequence object missing states are identified by '*'
have.miss <- which(rowSums(SRH.sub.seq=='*')>0)

## plotting non imputed vs imputed sequence
## (first 10 sequences in the set) 
par(mfrow=c(1,2))
seqiplot(SRH.sub.seq[have.miss,], withlegend=FALSE)
seqiplot(SRH.sub.iseq[have.miss,], withlegend=FALSE)



